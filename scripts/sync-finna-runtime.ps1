[CmdletBinding()]
param(
    [ValidateSet('codex', 'claude', 'all')]
    [string]$Target = 'all',

    [switch]$Check,

    [string]$DestinationRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $repoRoot 'finna\skills'
$skillNames = @('finna-log', 'finna-check', 'finna-docs')

if (-not (Test-Path -LiteralPath $sourceRoot)) {
    throw "Canonical Finna skills are missing: $sourceRoot"
}

function Get-TargetRoot([string]$name) {
    if ($DestinationRoot) {
        return $DestinationRoot
    }
    if ($name -eq 'codex') {
        return Join-Path $env:USERPROFILE '.codex\skills'
    }
    return Join-Path $repoRoot '.claude\skills'
}

$targets = if ($Target -eq 'all') { @('codex', 'claude') } else { @($Target) }
$driftFound = $false

foreach ($runtime in $targets) {
    $targetRoot = Get-TargetRoot $runtime
    foreach ($skillName in $skillNames) {
        $source = Join-Path $sourceRoot "$skillName\SKILL.md"
        $destination = Join-Path $targetRoot "$skillName\SKILL.md"
        if (-not (Test-Path -LiteralPath $source)) {
            throw "Missing canonical skill: $source"
        }

        $matches = (Test-Path -LiteralPath $destination) -and
            ((Get-FileHash -Algorithm SHA256 -LiteralPath $source).Hash -eq (Get-FileHash -Algorithm SHA256 -LiteralPath $destination).Hash)

        if ($Check) {
            if ($matches) {
                Write-Output "CURRENT runtime=$runtime skill=$skillName"
            }
            else {
                Write-Output "DRIFT runtime=$runtime skill=$skillName"
                $driftFound = $true
            }
            continue
        }

        $destinationDirectory = Split-Path -Parent $destination
        New-Item -ItemType Directory -Force -Path $destinationDirectory | Out-Null
        Copy-Item -LiteralPath $source -Destination $destination -Force
        Write-Output "SYNCED runtime=$runtime skill=$skillName"
    }
}

if ($Check -and $driftFound) {
    exit 1
}

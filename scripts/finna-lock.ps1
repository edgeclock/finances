[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)]
    [ValidateSet('acquire', 'status', 'release')]
    [string]$Action,

    [ValidateSet('codex', 'claude')]
    [string]$Agent = 'codex',

    [string]$LockPath,

    [ValidateRange(1, 120)]
    [int]$LeaseMinutes = 20
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($LockPath)) {
    $LockPath = Join-Path (Split-Path -Parent $PSScriptRoot) '.finna\active-write.json'
}

function Get-ActiveLease {
    if (-not (Test-Path -LiteralPath $LockPath)) {
        return $null
    }

    try {
        $lease = Get-Content -Raw -LiteralPath $LockPath | ConvertFrom-Json
        $expiresAt = [DateTimeOffset]::Parse([string]$lease.expiresAt)
        if ($expiresAt -le [DateTimeOffset]::Now) {
            Remove-Item -LiteralPath $LockPath -Force
            return $null
        }
        return $lease
    }
    catch {
        throw "Finna lock is unreadable: $LockPath. Resolve it manually before writing. $($_.Exception.Message)"
    }
}

function Write-Lease {
    $parent = Split-Path -Parent $LockPath
    New-Item -ItemType Directory -Force -Path $parent | Out-Null
    $now = [DateTimeOffset]::Now
    $lease = [ordered]@{
        agent = $Agent
        acquiredAt = $now.ToString('o')
        expiresAt = $now.AddMinutes($LeaseMinutes).ToString('o')
        machine = $env:COMPUTERNAME
        processId = $PID
    }
    $stream = [System.IO.File]::Open($LockPath, [System.IO.FileMode]::CreateNew, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)
    try {
        $writer = New-Object System.IO.StreamWriter($stream, (New-Object System.Text.UTF8Encoding($false)))
        try {
            $writer.Write(($lease | ConvertTo-Json))
        }
        finally {
            $writer.Dispose()
        }
    }
    finally {
        $stream.Dispose()
    }
    return [pscustomobject]$lease
}

$active = Get-ActiveLease

switch ($Action) {
    'status' {
        if ($null -eq $active) {
            Write-Output 'UNLOCKED'
            exit 0
        }
        Write-Output ("LOCKED agent={0} acquiredAt={1} expiresAt={2}" -f $active.agent, $active.acquiredAt, $active.expiresAt)
        exit 2
    }
    'acquire' {
        if ($null -ne $active) {
            [Console]::Error.WriteLine(("Finna is locked by {0} until {1}. Stay read-only and do not edit the ledger." -f $active.agent, $active.expiresAt))
            exit 2
        }
        try {
            $lease = Write-Lease
        }
        catch [System.IO.IOException] {
            $active = Get-ActiveLease
            if ($null -ne $active) {
                [Console]::Error.WriteLine(("Finna is locked by {0} until {1}. Stay read-only and do not edit the ledger." -f $active.agent, $active.expiresAt))
                exit 2
            }
            throw
        }
        Write-Output ("ACQUIRED agent={0} expiresAt={1}" -f $lease.agent, $lease.expiresAt)
        exit 0
    }
    'release' {
        if ($null -eq $active) {
            Write-Output 'UNLOCKED'
            exit 0
        }
        if ($active.agent -ne $Agent) {
            [Console]::Error.WriteLine(("Only {0} can release the active Finna lease." -f $active.agent))
            exit 3
        }
        Remove-Item -LiteralPath $LockPath -Force
        Write-Output ("RELEASED agent={0}" -f $Agent)
        exit 0
    }
}

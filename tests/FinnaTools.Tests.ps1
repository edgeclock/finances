$repoRoot = Split-Path -Parent $PSScriptRoot
$lockTool = Join-Path $repoRoot 'scripts\finna-lock.ps1'
$validator = Join-Path $repoRoot 'scripts\finna-validate.ps1'
$syncTool = Join-Path $repoRoot 'scripts\sync-finna-runtime.ps1'

Describe 'Finna runtime tools' {
    It 'checks the default project lease path' {
        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $lockTool status
        $LASTEXITCODE | Should Be 0
    }

    It 'validates the default project ledger path' {
        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator
        $LASTEXITCODE | Should Be 0
    }

    It 'validates the current finance ledger' {
        & $validator -Path (Join-Path $repoRoot 'index.html')
        $LASTEXITCODE | Should Be 0
    }

    It 'rejects an unknown transaction category' {
        $invalidLedger = Join-Path $TestDrive 'invalid-index.html'
        $ledger = Get-Content -Raw -LiteralPath (Join-Path $repoRoot 'index.html')
        $ledger.Replace('cat: "Groceries"', 'cat: "Not a category"') | Set-Content -LiteralPath $invalidLedger -Encoding UTF8

        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $validator -Path $invalidLedger
        $LASTEXITCODE | Should Be 1
    }

    It 'allows one runtime to own a lease and rejects a second runtime' {
        $lockPath = Join-Path $TestDrive 'active-write.json'

        & $lockTool acquire -Agent codex -LockPath $lockPath -LeaseMinutes 20
        $LASTEXITCODE | Should Be 0

        & $lockTool acquire -Agent claude -LockPath $lockPath -LeaseMinutes 20
        $LASTEXITCODE | Should Be 2

        & $lockTool release -Agent codex -LockPath $lockPath
        $LASTEXITCODE | Should Be 0
        Test-Path -LiteralPath $lockPath | Should Be $false
    }

    It 'installs and verifies native skill copies from the canonical source' {
        $destinationRoot = Join-Path $TestDrive 'runtime-skills'

        & $syncTool -Target codex -DestinationRoot $destinationRoot
        $LASTEXITCODE | Should Be 0
        Test-Path -LiteralPath (Join-Path $destinationRoot 'finna-log\SKILL.md') | Should Be $true

        & $syncTool -Target codex -DestinationRoot $destinationRoot -Check
        $LASTEXITCODE | Should Be 0
    }
}

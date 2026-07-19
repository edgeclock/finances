[CmdletBinding()]
param(
    [string]$Path
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($Path)) {
    $Path = Join-Path $repoRoot 'index.html'
}

if (-not (Test-Path -LiteralPath $Path)) {
    throw "Finance ledger is missing: $Path"
}

$content = Get-Content -Raw -LiteralPath $Path
$dataMatch = [regex]::Match($content, 'const DATA\s*=\s*(?<data>\{[\s\S]*?\n\});\s*\n\s*//\s*={8,}\s*\n\s*// HELPERS')
if (-not $dataMatch.Success) {
    throw 'Could not isolate the DATA object from index.html.'
}

$node = Get-Command node -ErrorAction Stop
$temporaryScript = Join-Path $env:TEMP ("finna-validate-{0}.js" -f [guid]::NewGuid().ToString('N'))
$temporaryData = Join-Path $env:TEMP ("finna-data-{0}.js" -f [guid]::NewGuid().ToString('N'))
try {
    @'
const fs = require('fs');
const vm = require('vm');
const source = fs.readFileSync(process.argv[2], 'utf8');
const result = vm.runInNewContext('JSON.stringify(' + source + ')');
process.stdout.write(result);
'@ | Set-Content -LiteralPath $temporaryScript -Encoding UTF8

    $dataMatch.Groups['data'].Value | Set-Content -LiteralPath $temporaryData -Encoding UTF8
    $json = & $node.Source $temporaryScript $temporaryData
    if ($LASTEXITCODE -ne 0) {
        throw 'Node could not parse the DATA object.'
    }
    $data = $json | ConvertFrom-Json
}
finally {
    Remove-Item -LiteralPath $temporaryScript -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $temporaryData -Force -ErrorAction SilentlyContinue
}

$errors = New-Object System.Collections.Generic.List[string]
if (-not $data.lastUpdated) { $errors.Add('DATA.lastUpdated is required.') }
if (-not $data.accounts -or $data.accounts.Count -eq 0) { $errors.Add('DATA.accounts must contain at least one account.') }
if (-not $data.categoryOrder -or $data.categoryOrder.Count -eq 0) { $errors.Add('DATA.categoryOrder is required.') }

$accountLabels = @($data.accounts | ForEach-Object { $_.label })
if (($accountLabels | Select-Object -Unique).Count -ne $accountLabels.Count) { $errors.Add('Account labels must be unique.') }
foreach ($account in $data.accounts) {
    if ([double]$account.balance -lt 0) { $errors.Add("Negative account balance: $($account.label)") }
}

$validCategories = @($data.categoryOrder) + @('Income', 'Transfer', 'Utilities')
$validWallets = @('gcash', 'rcbc', 'maya', 'coins', 'cash', 'gotyme', 'gcashsavings', 'mayasavings', 'gotymewallet')
$transactions = @($data.monthArchive) + @($data.transactions)
foreach ($transaction in $transactions) {
    if ($validCategories -notcontains $transaction.cat) { $errors.Add("Invalid category '$($transaction.cat)' in $($transaction.date): $($transaction.desc)") }
    if ($validWallets -notcontains $transaction.wallet) { $errors.Add("Invalid wallet '$($transaction.wallet)' in $($transaction.date): $($transaction.desc)") }
    if (@('income', 'expense') -notcontains $transaction.type) { $errors.Add("Invalid transaction type '$($transaction.type)' in $($transaction.date): $($transaction.desc)") }
    if ([double]$transaction.amount -le 0) { $errors.Add("Non-positive transaction amount in $($transaction.date): $($transaction.desc)") }
}

foreach ($report in @($data.monthlyReports)) {
    $expectedNetSavings = [math]::Round(([double]$report.income - [double]$report.expenses), 2)
    if ($expectedNetSavings -ne [math]::Round([double]$report.netSavings, 2)) {
        $errors.Add("Monthly report '$($report.key)' has an inconsistent netSavings value.")
    }
}

$trackedDocumentation = @(git -C $repoRoot ls-files -- '*.md' '*.json')
foreach ($relativePath in $trackedDocumentation) {
    $filePath = Join-Path $repoRoot $relativePath
    if ((Get-Content -Raw -LiteralPath $filePath) -match 'dashboard\.html') {
        $errors.Add("Stale dashboard.html reference: $relativePath")
    }
}

$totalAssets = [math]::Round((@($data.accounts | Measure-Object -Property balance -Sum).Sum), 2)
$totalLiabilities = [math]::Round(([double]$data.liabilities.spaylater + [double]$data.liabilities.bike), 2)
$totalReceivables = [math]::Round((@($data.receivables.psobject.Properties | ForEach-Object { [double]$_.Value } | Measure-Object -Sum).Sum), 2)
$periodExpenses = [math]::Round((@($data.transactions | Where-Object { $_.type -eq 'expense' -and $_.cat -ne 'Transfer' } | Measure-Object -Property amount -Sum).Sum), 2)

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output ("VALID accounts={0} transactions={1} assets={2:N2} liabilities={3:N2} receivables={4:N2} periodExpenses={5:N2}" -f $data.accounts.Count, $transactions.Count, $totalAssets, $totalLiabilities, $totalReceivables, $periodExpenses)

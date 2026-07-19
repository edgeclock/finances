---
name: finna-log
description: Log a confirmed spending, income, or internal-transfer report to Finna's live ledger.
---

# Finna Transaction Logger

Read `finna/FINNA.md` before use. Use this skill only for confirmed money activity.

## Workflow

1. Identify every reported amount, date, wallet, category, and whether it is income, expense, or an internal transfer.
2. Ask for the wallet when it is not explicit. Do not default a financial transaction from guesswork.
3. Acquire the runtime lease, then reread `index.html`.
4. Add confirmed transactions to `DATA.transactions[]`. Internal movements use matching `Transfer` records and are excluded from spending totals.
5. Update the affected account balances only when money actually moved.
6. Update `DATA.lastUpdated` and `salary.dayOfPeriod` when applicable.
7. Add a concise entry to `finna/AUDIT-LOG.md`; update the account snapshot after material balance changes.
8. Run `scripts/finna-validate.ps1`, commit, push, and release the lease.

## Valid IDs

Use the exact category and wallet rules in `finna/DATA-CONTRACT.md`. Read the existing data before adding a new wallet or category. Never duplicate a transaction with the same date, description, amount, wallet, and type.

## Response

Report the number of entries logged, the affected wallet balance, and one warning only when the ledger shows a material issue. Do not claim a change was saved until validation and push have succeeded.

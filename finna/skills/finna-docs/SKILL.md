---
name: finna-docs
description: Rebuild Finna's canonical account documentation from the current live ledger after material changes.
---

# Finna Documentation Sync

Read `finna/FINNA.md` before use. The source hierarchy is non-negotiable: `index.html` first, canonical Finna docs second, legacy vault never.

## When to Use

Use after a paycheck distribution, new account, material balance change, changed account purpose, changed liability or receivable, or financial-goal milestone.

## Workflow

1. Acquire the runtime lease if documentation changes are part of a finance update. For documentation-only drift, still confirm no other runtime holds the lease before writing.
2. Read `DATA.accounts`, liabilities, receivables, salary, and goals from `index.html`.
3. Update `finna/docs/ACCOUNT-SNAPSHOT.md` from those values, including its as-of date and totals.
4. Add a dated summary to `finna/AUDIT-LOG.md` if a material ledger event caused the change.
5. Run `scripts/finna-validate.ps1`, commit, push, and release the lease.

Do not copy figures from `C:\Users\PC\.claude\projects\Finna\Finna\`. Its records are intentionally read-only and stale.

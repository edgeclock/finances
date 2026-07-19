---
name: finna-check
description: Audit Finna's ledger when balances, spending totals, reports, or the local dashboard look incorrect.
---

# Finna Ledger Check

Read `finna/FINNA.md` before use. `index.html` is authoritative.

## Read-Only Audit

1. Run `powershell -ExecutionPolicy Bypass -File scripts/finna-lock.ps1 status`.
2. Run `powershell -ExecutionPolicy Bypass -File scripts/finna-validate.ps1`.
3. Compare the current account snapshot and audit log with the ledger only to identify documentation drift.
4. Confirm the local dashboard at `http://localhost:3000/index.html` renders the current `lastUpdated` date, account cards, and transaction log.

## If a Fix Is Needed

Acquire the correct runtime lease before changing data. Reread the ledger, make the smallest verified correction, update canonical documentation, validate, commit, push, and release.

Never correct a balance from an old Claude vault value. Report unresolved discrepancies with the exact ledger fields and evidence needed from Edge.

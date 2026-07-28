# Cash Reconciliation Adjustment Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Record a verified PHP 5.00 cash reconciliation without classifying it as income or spending.

**Architecture:** Add a constrained `adjustment` transaction type to the ledger contract and validator. The dashboard treats it as a positive account movement while leaving income and expense aggregates unchanged.

**Tech Stack:** Static HTML/JavaScript dashboard, PowerShell validator, Pester tests.

## Global Constraints

- `index.html` remains the live ledger.
- An `adjustment` is valid only with `wallet: "cash"` and `cat: "Misc"`.
- Reconciliation adjustments never count as income or spending.
- Follow the Finna lease, validation, Git, and documentation workflow.

---

### Task 1: Validate the adjustment type

**Files:**
- Modify: `tests/FinnaTools.Tests.ps1`
- Modify: `scripts/finna-validate.ps1`

- [x] **Step 1: Write the failing test**

Add a Pester test that writes a ledger containing `{ date: "Jul 28", desc: "Cash reconciliation — blessing", cat: "Misc", amount: 5.00, wallet: "cash", type: "adjustment" }`, expects validator exit code 0, then rewrites the wallet to `gcash` and expects exit code 1.

- [x] **Step 2: Run the test to verify it fails**

Run: `Invoke-Pester .\\tests\\FinnaTools.Tests.ps1`

Expected: the valid adjustment assertion fails because `adjustment` is not yet a valid transaction type.

- [x] **Step 3: Implement the validator rule**

Allow `adjustment` alongside `income` and `expense`. For `adjustment`, add an error unless `wallet` is `cash` and `cat` is `Misc`.

- [x] **Step 4: Run tests**

Run: `Invoke-Pester .\\tests\\FinnaTools.Tests.ps1`

Expected: all tests pass.

### Task 2: Record and present the reconciliation

**Files:**
- Modify: `index.html`
- Modify: `finna/DATA-CONTRACT.md`
- Modify: `finna/AUDIT-LOG.md`
- Modify: `finna/docs/ACCOUNT-SNAPSHOT.md`

- [x] **Step 1: Add the confirmed ledger entry**

Append the approved Jul 28 adjustment to `DATA.transactions[]`, increase Cash on hand by PHP 5.00, and retain the existing `lastUpdated` and salary period day.

- [x] **Step 2: Update display logic**

Render `income` and `adjustment` rows as positive values and include `adjustment` in account net calculations, but leave income and expense aggregates unchanged.

- [x] **Step 3: Update canonical documentation**

Document the restricted adjustment type, add the Codex audit entry, and rebuild cash/assets values in the account snapshot.

- [x] **Step 4: Verify and publish**

Run `scripts\\finna-validate.ps1`, run Pester tests, inspect the local dashboard response, commit the verified files, push `main`, and release the lease.

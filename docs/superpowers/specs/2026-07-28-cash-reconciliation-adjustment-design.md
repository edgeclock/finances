# Cash Reconciliation Adjustment Design

## Purpose

Record a verified physical-cash difference without misclassifying it as salary, ordinary income, or spending.

## Approved Design

Finna will support a third transaction type, `adjustment`, only for a verified cash reconciliation. An adjustment must use wallet `cash` and category `Misc`. It appears as a positive amount in account and transaction history, increases the affected cash balance, and is excluded from income and expense totals.

The confirmed entry is dated Jul 28, 2026: `Cash reconciliation — blessing`, PHP 5.00, cash, `Misc`, `adjustment`.

## Validation and Documentation

The validator must reject adjustments that use another wallet or category. The data contract, audit log, and account snapshot must identify this entry as a reconciliation adjustment, not income.

## Acceptance Criteria

- A cash/Misc adjustment validates successfully.
- An adjustment with any other wallet or category fails validation.
- The dashboard shows the adjustment as `+PHP 5.00`.
- Period income and expenses remain unchanged.

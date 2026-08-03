# Finna Ledger Data Contract

`index.html` contains `const DATA = { ... }`. It is a JavaScript data block, not an external database.

## Required Collections

- `accounts[]`: unique `label`, non-negative `balance`, `tag`, and `tagLabel`.
- `transactions[]`: the **current calendar month's** entries. (Changed 2026-08-03 — see "Monthly monitoring" below. Was "current salary-period entries" before Edge resigned.)
- `monthArchive[]`: **deprecated 2026-08-03**, always empty. Existed to bridge mid-month pay-period resets under the old semi-monthly cycle; no longer needed since `transactions[]` itself is now month-scoped. Left in the data shape only because some rendering JS still references it defensively — do not write to it.
- `categoryOrder[]`: primary expense categories.
- `liabilities`, `receivables`, `monthly`, `subscriptions`, `recurringCommitments`, and `monthlyReports`.

`subscriptions[]` and `recurringCommitments[]` share the same shape (`name`, `amount`, `wallet`, `dueDay`, `paid`) and the same monthly reset mechanism (paid resets to false on the 1st, flips to true as each is logged). They are kept as two separate arrays because `subscriptions` is specifically app/service subscriptions (feeds the "Subscriptions / month" total), while `recurringCommitments` holds other recurring monthly money commitments (e.g. ongoing charity giving) that should not be counted in that total. `recurringCommitments` entries also carry a `cat` field for their transaction category.

## Monthly monitoring (replaced the semi-monthly pay-period cycle, 2026-08-03)

Edge resigned from his job on 2026-08-03 — no more paychecks to anchor a "pay period" to. `DATA.salary` (periodStart/periodEnd/dayOfPeriod/totalDays/nextDate) was replaced by **`DATA.monthly`**: `lastIncome`, `lastIncomeDate` (historical only), `monthStart`, `monthEnd`, `dayOfMonth`, `daysInMonth`, `nextReset`. `DATA.periodSpending` was renamed **`DATA.monthlySpending`** (same `wallets[]` shape: `id`, `label`, `src`, `budget`).

- `transactions[]` now represents the current calendar month only. At month-end, the `monthly-report-compile` scheduled task compiles it into `DATA.monthlyReports[]` and clears `transactions[]` for the new month (this task previously only cleared `monthArchive`; as of 2026-08-03 it owns clearing `transactions[]` too, since there's no more period-reset routine to do it).
- There is no more 10th/25th period reset. Don't apply the old semi-monthly distribution-formula routine (see `financial_plan` memory) — it's paused until Edge has income again.
- `DATA.monthlySpending.wallets[].budget` figures are set manually by Edge/Finna check-in, same as before — just no longer derived from a paycheck-distribution formula. As of 2026-08-03 these are stale leftovers from the last paycheck and need Edge's input on real monthly budgets.

## Transaction Rules

Each transaction has `date`, `desc`, `cat`, `amount`, `wallet`, and `type`.

- `type` is `income`, `expense`, or `adjustment`.
- `amount` is greater than zero.
- Valid categories are every `categoryOrder` value plus `Income`, `Transfer`, `Reconciliation`, and historical `Utilities`, `Misc` (the latter two no longer used for new transactions — `Misc` was retired 2026-08-03, see below; kept valid only so old/historical entries and the frozen June/July `monthlyReports` category breakdowns don't fail validation).
- `categoryOrder` (as of 2026-08-03): `Food & dining`, `Groceries`, `Transport`, `Load / comms`, `Subscriptions`, `Charity`, `Family`, `Household`, `Loans`, `Debt payment`, `Investments`.
  - `Household`: home/personal-care consumables that aren't groceries (water, laundry, small household items like an umbrella).
  - `Loans`: money lent out to other people (creates a `receivables` entry). Loan *repayments received* stay `cat: "Income"`, not `Loans`.
  - `Debt payment`: paying down an existing liability (e.g. SPayLater), distinct from regular discretionary spending.
  - `Investments`: costs tied to investing (e.g. GoTrade transfer fees) — NOT the investment principal itself, which stays `cat: "Transfer"` (internal movement between Edge's own accounts/assets).
- Valid wallet IDs are `gcash`, `rcbc`, `maya`, `coins`, `cash`, `gotyme`, `gcashsavings`, `mayasavings`, `gotymewallet`, and `gotrade`.
- `Transfer` entries record internal movements and are excluded from spending totals.
- An `adjustment` is a verified cash-count reconciliation only: it must use wallet `cash` and category `Reconciliation` (changed from `Misc` on 2026-08-03), is shown as a positive cash movement, and is excluded from income and spending totals.
- Do not mutate an account balance for expected income that has not actually arrived.

## "Misc" retirement (2026-08-03)

`Misc` was removed as an active category — every live transaction that used it was reclassified into `Household`, `Loans`, `Debt payment`, or `Investments`. If a new transaction doesn't cleanly fit any existing category, create a new distinct one and add it to `categoryOrder` rather than reaching for a catch-all. The June 2026 and part of the July 2026 `monthlyReports` category breakdowns still contain a frozen `Misc` bucket — their underlying itemized transactions were already archived/compiled before this change and are no longer available to reclassify. Don't try to further break those down; they're historical record, not live data.

## Documentation Rule

When `accounts`, liabilities, receivables, purpose labels, or a financial goal changes materially, update `finna/docs/ACCOUNT-SNAPSHOT.md` from the live ledger after validation. Do not use the legacy vault as an input.

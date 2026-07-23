# Finna Ledger Data Contract

`index.html` contains `const DATA = { ... }`. It is a JavaScript data block, not an external database.

## Required Collections

- `accounts[]`: unique `label`, non-negative `balance`, `tag`, and `tagLabel`.
- `transactions[]`: current salary-period entries.
- `monthArchive[]`: earlier entries in the same calendar month.
- `categoryOrder[]`: primary expense categories.
- `liabilities`, `receivables`, `salary`, `subscriptions`, `recurringCommitments`, and `monthlyReports`.

`subscriptions[]` and `recurringCommitments[]` share the same shape (`name`, `amount`, `wallet`, `dueDay`, `paid`) and the same monthly reset mechanism (paid resets to false on the 1st, flips to true as each is logged). They are kept as two separate arrays because `subscriptions` is specifically app/service subscriptions (feeds the "Subscriptions / month" total), while `recurringCommitments` holds other recurring monthly money commitments (e.g. ongoing charity giving) that should not be counted in that total. `recurringCommitments` entries also carry a `cat` field for their transaction category.

## Transaction Rules

Each transaction has `date`, `desc`, `cat`, `amount`, `wallet`, and `type`.

- `type` is `income` or `expense`.
- `amount` is greater than zero.
- Valid categories are every `categoryOrder` value plus `Income`, `Transfer`, and historical `Utilities`.
- Valid wallet IDs are `gcash`, `rcbc`, `maya`, `coins`, `cash`, `gotyme`, `gcashsavings`, `mayasavings`, and `gotymewallet`.
- `Transfer` entries record internal movements and are excluded from spending totals.
- Do not mutate an account balance for expected income that has not actually arrived.

## Documentation Rule

When `accounts`, liabilities, receivables, purpose labels, or a financial goal changes materially, update `finna/docs/ACCOUNT-SNAPSHOT.md` from the live ledger after validation. Do not use the legacy vault as an input.

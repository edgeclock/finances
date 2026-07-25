# Finna Audit Log

## Jul 25, 2026 - Period reset: new salary period, salary notably reduced

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report ("received salary 17,354.21 rcbc" dated Jul 24).
- Period reset performed (10th/25th boundary): appended the outgoing Jul 11-25 period's 79 transactions to `DATA.monthArchive[]` (still within July, so appended not cleared). Cleared `DATA.transactions[]`, seeded it with the new "Salary received" ₱17,354.21 income entry (wallet rcbc), dated Jul 24.
- Balance update: RCBC savings ₱134.73 → ₱17,488.94.
- `DATA.salary` updated: recent ₱17,354.21, periodStart "Jul 24", periodEnd/nextDate "Aug 10, 2026", dayOfPeriod 2, totalDays 18 (calendar days Jul 24 - Aug 10 inclusive).
- `DATA.salaryHistory`: "Jul 25" entry updated from placeholder ₱37,000 (actual: false) to confirmed ₱17,354.21 (actual: true).
- `lastUpdated` → Jul 25, 2026.
- **Not done, needs Edge's input:** `DATA.periodSpending.wallets[].budget` (GCash/RCBC/Maya/Coins) were left at their prior-period values — this salary is far below the usual ₱25K-40K range (well below even the ₱21,976.52 two periods ago), so the standard distribution formula in `finna/FINNA.md`/dashboard_setup memory would likely break the same way it did at ₱21,976.52 (Maya allocation going negative), only worse. Also no updated account-balance screenshots were given for GCash savings/GCash wallet/GoTyme/Coins.ph/Maya wallet — cannot log the actual paycheck distribution transactions until Edge confirms how this smaller paycheck was split. Flagged to Edge in chat; do not guess a distribution.
- Flag: this may be the part-time income reduction landing earlier than the Aug 10 date noted in [[user_profile]]/[[financial-plan]] memory — worth confirming with Edge rather than assuming.
- **Script fix:** `scripts/finna-validate.ps1` threw `PropertyNotFoundStrict` on `Measure-Object -Sum` when a filtered collection was empty (exactly this period reset's situation — `transactions[]` freshly reset to a single income entry, zero expenses). Under `Set-StrictMode -Version Latest`, `Measure-Object` over an empty pipeline doesn't produce a `.Sum` property to read. Fixed by adding a `Get-SafeSum` helper that returns 0 for empty/null input instead of piping straight into `Measure-Object`. This will recur every period reset otherwise (transactions[] often starts a new period with income-only entries), so worth having fixed now rather than hitting it again in two weeks.
- Validation: `finna-validate.ps1` passed after the script fix (VALID accounts=12 transactions=105 assets=79,542.62 liabilities=22,673.91 receivables=0.00 periodExpenses=0.00).

## Jul 23, 2026 - Correction: all tithes so far were to Victory LB

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat correction.
- Fix: standardized the description on the Jul 5 and Jul 12 tithe entries from "Tithes (Coins.ph)" to "Tithes (Victory LB)", matching the Jul 19 entry and confirming all tithes logged so far went to the same recipient (Victory LB). No amounts or balances changed — description only.
- Validation: `finna-validate.ps1` passed.

## Jul 23, 2026 - Correction: name spelling "Even Tolorio" → "Evan Tolorio"

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat correction, flagged from the dashboard's Upcoming Payments view.
- Fix: corrected the recipient's name in the Jul 22 "Missionary support" transaction and in `DATA.recurringCommitments[]`, plus in this audit log's own prior entries referencing the same name. No amounts or balances changed — spelling only.
- Validation: `finna-validate.ps1` passed.

## Jul 23, 2026 - Logged Jul 19 tithes (retroactive)

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report.
- Ledger change: added expense "Tithes (Victory LB)" ₱500.00, wallet coins, cat Charity, dated Jul 19.
- Balance update: Coins.ph PHP ₱5,183.29 → ₱4,683.29.
- Validation: `finna-validate.ps1` passed.

## Jul 23, 2026 - Correction: duplicate Jul 22 breakfast entry

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat correction, flagged from the dashboard's transaction log view.
- Audit finding: the Jul 22 "Breakfast" ₱60.00 had been logged twice — once as `wallet: "cash"` (from an earlier same-day report) and once as `wallet: "gcash"` (from a later, more detailed batch report). Edge confirmed it was actually gcash both times — the cash-tagged entry was a genuine duplicate, not a second breakfast.
- Fix: removed the duplicate `wallet: "cash"` entry, kept the correct `wallet: "gcash"` entry. Refunded the erroneous ₱60.00 deduction back to Cash on hand.
- Balance update: Cash on hand ₱399.50 → ₱459.50. No change to GCash wallet (its entry was already correct).
- Validation: `finna-validate.ps1` passed.

## Jul 23, 2026 - Bitget BTC fully liquidated to GCash wallet

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report. Edge's stated reasoning: needs liquid cash; crypto had been informally functioning as his emergency buffer; plans (not yet decided/actioned) to redirect future monthly investing toward something like S&P 500 instead of crypto starting next pay period — noted for context, no ledger structure created for this yet since it's still a plan, not a confirmed transaction.
- Ledger change: added transaction "Bitget BTC liquidation" ₱13,198.26, wallet gcash, type income, cat **Transfer** (not "Income") — this is an internal asset conversion (crypto → cash within Edge's own accounts), not new external income, so it's excluded from the monthly report's income total, consistent with the Income-vs-Transfer rule in `finna/DATA-CONTRACT.md` / dashboard_setup memory.
- Balance updates: Bitget BTC ₱11,840.45 (0.003287 BTC) → ₱0.00 (0 BTC), tagLabel updated to "liquidated Jul 23". GCash wallet ₱1,287.63 → ₱14,485.89.
- Note: did not split out the ₱1,357.81 difference between the last recorded Bitget balance and the actual liquidation proceeds as a separate "gain" entry — Edge reported only the total proceeds, not a cost basis or gain figure, so no gain/loss breakdown was assumed. Net worth is unaffected by this choice (total assets already reflect the full swap correctly either way); only the monthly report's income/expense split would change if a breakdown were added later.
- Validation: `finna-validate.ps1` passed.

## Jul 23, 2026 - Logged Jul 21-22 activity; JR loan cleared; new recurring charity commitment

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report.
- Ledger changes (7 transactions):
  - Jul 21: Water ₱100.00 (cash, expense)
  - Jul 22: Groceries ₱1,095.74 (gcash, expense)
  - Jul 22: Dinner ₱215.00 (gcash, expense)
  - Jul 22: Breakfast ₱60.00 (gcash, expense)
  - Jul 22: Missionary support (Evan Tolorio) ₱500.00 (coins, expense, Charity)
  - Jul 22: Shopee order ₱207.00 (rcbc, expense)
  - Jul 22: JR loan repayment ₱562.00 (gcash, income)
- Balance updates: Cash ₱499.50 → ₱399.50. GCash wallet ₱2,096.37 → ₱1,287.63. RCBC savings ₱341.73 → ₱134.73. Coins.ph PHP ₱5,683.29 → ₱5,183.29.
- Receivables: `jr` ₱562.00 → ₱0 (fully repaid, all receivables now clear). Removed "JR owes" monitoring alert.
- New: added `DATA.recurringCommitments[]` — Missionary support (Evan Tolorio) ₱500/month via Coins.ph, dueDay 22, same paid/reset mechanism as `subscriptions` but tracked separately (not a "Subscriptions"-category cost). Updated `finna/DATA-CONTRACT.md` to document this new collection. Extended the `monthly-subscription-reset` scheduled task to also reset `recurringCommitments` each month and to follow the dual-runtime lease protocol.
- `lastUpdated` → Jul 23, 2026. `salary.dayOfPeriod` 12 → 13.
- Flag: RCBC now very low (₱134.73) — 2 days left until Jul 25 payday.
- Validation: `finna-validate.ps1` passed.

## Jul 22, 2026 - Logged breakfast

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report.
- Ledger change: added expense "Breakfast" ₱60.00, wallet cash, dated Jul 22.
- Balance update: Cash on hand ₱559.50 → ₱499.50.
- `lastUpdated` → Jul 22, 2026. `salary.dayOfPeriod` 10 → 12.
- Validation: `finna-validate.ps1` passed.

## Jul 20, 2026 - New recurring subscription: ChatGPT Plus

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report.
- Ledger change: added expense "ChatGPT Plus" ₱999.00, wallet rcbc, cat Subscriptions, dated Jul 19. Added as a new entry in `DATA.subscriptions[]` (dueDay 19, paid: true this cycle) so it's tracked for future monthly resets alongside CapCut/Canva/Google One/Claude Pro.
- Balance update: RCBC savings ₱1,340.73 → ₱341.73.
- `monthlyAllocation` "Subscriptions" planning figure updated ₱3,059 → ₱4,058 to include the new recurring cost.
- Validation: `finna-validate.ps1` passed.
- Flag: RCBC balance is now low (₱341.73) against its period budget — worth noting to Edge.

## Jul 20, 2026 - Logged Jul 19 laundry (retroactive)

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report. Edge initially wrote "June 19" — confirmed with him before logging that he meant July 19, rather than guessing.
- Ledger change: added expense "Laundry" ₱175.00, wallet gcash, dated Jul 19.
- Balance update: GCash wallet ₱2,271.37 → ₱2,096.37.
- `lastUpdated` → Jul 20, 2026. `salary.dayOfPeriod` 9 → 10.
- Validation: `finna-validate.ps1` passed.

## Jul 19, 2026 - Papa's loan fully repaid

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report.
- Ledger change: added income transaction "Papa loan repayment" ₱1,500.00 to GCash wallet, Jul 19.
- Balance update: GCash wallet ₱771.37 → ₱2,271.37.
- Receivables: `papa` ₱1,500.00 → ₱0 (fully repaid — Jul 15 loan ₱3,500, repaid ₱2,000 Jul 17 + ₱1,500 Jul 19). Removed the "Papa owes" monitoring alert and updated the receivable note to JR-only.
- Validation: `finna-validate.ps1` passed.

## Jul 19, 2026 - Logged 6 expenses (fare x2, coffee, groceries, meal prep x2)

- Runtime: Claude Code.
- Confirmed source: Edge, direct chat report.
- Ledger change: added 6 transactions dated Jul 19 — Fare ₱13 (cash) x2, Coffee ₱210 (gcash), Groceries ₱580.75 (gcash), Meal prep ₱579.41 (gcash), Meal prep ₱405.00 (cash). Total GCash spend ₱1,370.16, total Cash spend ₱431.00.
- Balance updates: GCash wallet ₱2,141.53 → ₱771.37. Cash on hand ₱990.50 → ₱559.50.
- `lastUpdated` → Jul 19, 2026. `salary.dayOfPeriod` 8 → 9 (day 9 of Jul 11–25 period).
- Validation: `finna-validate.ps1` passed.

## Jul 19, 2026 - Edge reversed the privacy migration: repo public, GitHub Pages restored

- Runtime: Claude Code.
- Confirmed source: Edge, direct instruction in chat, after Finna explained the practical tradeoff (private+local-only breaks his phone PWA/home-screen access to the dashboard).
- Change: `edgeclock/finances` set back to **public** visibility (`gh repo edit --visibility public`). GitHub Pages re-enabled on `main` / `/root` (`gh api repos/edgeclock/finances/pages`), confirmed `status: building`, `html_url: https://edgeclock.github.io/finances/`.
- This directly reverses the "Made the GitHub repository private and disabled GitHub Pages" line in the migration entry below. Edge made this call knowingly — do not re-apply the private/local-only setting without asking him again first.
- Updated `finna/FINNA.md` and `finna/CLAUDE-CODE-HANDOVER.md` "Current State" to reflect public + Pages-enabled as the current state, so this isn't re-flipped by mistake in a future session (either runtime).
- No ledger (`index.html`) data changed. `finna-validate.ps1` run as a sanity check regardless, per the shared write protocol.

## Jul 19, 2026 - Dual-runtime setup

- Established `index.html` as the sole live ledger for Codex and Claude Code.
- Created canonical Finna instructions, skills, documentation, validation, runtime sync, and a local write lease.
- Made the GitHub repository private and disabled GitHub Pages. The dashboard is now local-only.
- Rebuilt the account snapshot from the Jul 18, 2026 ledger state.
- Preserved the prior Claude vault as a read-only recovery snapshot; it is no longer a documentation source.

Future entries go above this section and must identify the date, runtime, confirmed source, ledger change, and validation result.

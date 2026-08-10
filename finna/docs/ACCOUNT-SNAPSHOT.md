# Account Snapshot

**Source:** `index.html`
**As of:** Aug 10, 2026
**Status:** MAJOR RESTRUCTURE Aug 8: 6-jar MM system adopted (T. Harv Eker modified). Cash correction (Edge-confirmed): cash on hand 4,001.75 → 3,303.50, difference 698.25 = travel expenses booked (new Travel category). Total assets 54,202.72. Full 6-jar dashboard implemented (jar summary section, per-jar targets/status, account jar mapping). Edge decision: essential monthly expenses = ~₱20,000-21,000 (fixed ~13,000-13,400 + variable ~7,000-8,000), rent excluded (derived ₱7,700 unconfirmed, footnote only).

## Accounts (6-jar structure)

| Account | Balance | Jar / Purpose |
|---|---:|---|
| GCash wallet | PHP 2,943.45 | **NEC jar** - spending |
| GCash bank | PHP 4,630.41 | **FFA jar** (10%) - growth buffer (was emergency fund) |
| RCBC savings | PHP 4,508.41 | **NEC jar** - temporarily inaccessible, kept booked |
| Cash on hand | PHP 2,823.50 | **NEC jar** - cash (post travel-expense correction) |
| GoTyme nec vault | PHP 13,663.72 | **NEC jar** - GoTyme vault (housing/essentials) |
| GoTyme Professional Development (LTSS) | PHP 5,630.42 | **LTSS jar** (10%) |
| GoTyme My Go Save (PLAY) | PHP 5,642.27 | **PLAY jar** (10%) - includes ₱11.85 pre-existing legacy, never booked |
| Maya bank | PHP 5,630.42 | **EDU jar** (10%) |
| Maya wallet | PHP 0.00 | Distribution hub |
| GoTyme wallet | PHP 0.00 | Distribution hub |
| Coins.ph PHP | PHP 5,418.71 | **GIVE jar** - charity/tithes (untouched, not-his-money giving fund) |
| GoTrade | PHP 1,000.00 | **FFA jar** - SPY (invested) |
| Tonik Bank | PHP 52.66 | Outside system |
| Alkansya | PHP 479.75 | Outside system - joins the jars later |

**Total assets:** PHP 52,423.72 (jars 51,891.31 + Tonik/Alkansya 532.41)
**Liabilities:** PHP 15,688.17 (SPayLater - next due Aug bill PHP 6,969.87 on Sep 15, 2026)
**Receivables:** PHP 3,178.75 (JR PHP 3,010.00 + RJ PHP 166.75 + Bryan PHP 2.00)
**Ledger net worth formula:** assets + receivables - liabilities.

## 6-jar system (adopted Aug 8, 2026)

- Jars = the 6 MAIN categories. Existing ledger categories become subcategories:
  - **NEC** (Necessities): Food & dining, Groceries, Household, Transport, Travel, Utilities, Load/Comms, Debt payment (SPayLater), Subscriptions, Rent
  - **FFA** (Financial Freedom): Investments, savings growth
  - **LTSS** (Long-Term Savings): long-term savings for spending, debt paydown
  - **EDU** (Education): education, books, courses, skill tools
  - **PLAY**: entertainment, eating out, coffee, fun
  - **GIVE**: tithes, charity, missionary support
- Percentages: NEC 50%, FFA/LTSS/EDU/PLAY/GIVE 10% each.
- This period: one-time split of pool 50,673.75 - NEC 50/90 = 28,152.08, FFA/LTSS/EDU/PLAY 10/90 = 5,630.42 each, GIVE 0 (Coins.ph pre-funded). Next period: standard 50/10/10/10/10/10 with GIVE 10%.
- Pool excluded Tonik, Alkansya, Coins.ph; included cash on hand and GoTrade (GoTrade = already-invested FFA).
- Dashboard: new "6-jar summary" section shows per-jar balance vs target with OK/LOW/OVER status (tolerance 1.00 for split rounding). Jar balances: NEC 23,939.08 (LOW vs 28,152.08 - travel expense + spend), FFA 5,630.41 (OK), LTSS 5,630.42 (OK), EDU 5,630.42 (OK), PLAY 5,642.27 (OK), GIVE 5,418.71 (OVER - pre-funded, expected).

## Employment status - no income since Jul 24, 2026

**Edge resigned from his VA job Aug 3, 2026.** No income currently.

- **Now on monthly monitoring, not pay-period tracking** (as of Aug 3, 2026) - `DATA.monthly` replaced `DATA.salary`. Current: month Aug 1-31, 2026, day 10 of 31, resets Sep 1.
- **The semi-monthly distribution formula is paused** - nothing to distribute until income resumes; the 6-jar system replaces it.
- **`DATA.monthlySpending.wallets[].budget`** set Aug 7, 2026 from real ledger data (Edge decision): gcash 6,000, rcbc 3,000, maya 1,000, coins 1,000. Basis: Aug 1-7 actuals + fixed subscriptions + no-income reality. DeepSeek usage is volatile (₱1,319.55 in first 7 days) - flagged for mid-month rcbc recheck. `monthlyAllocation` donut still stale paycheck-era display, pending Edge decision.
- `DATA.salaryHistory` future placeholders removed - it's now a pure historical record ending Jul 25, 2026 (last actual paycheck).
- RCBC temporarily inaccessible - follow up pending.
- Housing comes from the NEC jar (GoTyme nec vault). GoTyme buffer pre-restructure (₱4,527.84) now spread into NEC/LTSS/PLAY vaults.
- GCash wallet (NEC spending) at 2,943.45 is under the ₱3,059 subscription threshold - dashboard LOW alert active until next NEC top-up or income.
- Aug 9 Palawan expenses logged (Edge-confirmed): food 75 cash, dinner 130 cash, dinner 245 cash, internet (parents' subscription) 1,299 from GoTyme nec vault.

## Category system - "Misc" retired Aug 3, 2026

Active categories: Food & dining, Groceries, Transport, **Travel** (added Aug 8 for the cash-correction expense), Load / comms, Subscriptions, Charity, Family, **Household**, **Loans**, **Debt payment**, **Investments**. `Misc` is no longer used for new transactions - see `finna/DATA-CONTRACT.md` for the full rule and category definitions. (June 2026 and part of July 2026's compiled `monthlyReports` still carry a frozen legacy `Misc` bucket that can't be itemized further - historical limitation, not an active category.)

## Pre-resignation reference (historical - last confirmed paycheck)

- Period: Jul 24, 2026 to Aug 10, 2026 (last pay period, cut short by the resignation)
- Most recent salary: PHP 17,354.21 (Jul 24 - notably reduced; may have been an early signal of the situation that led to resignation)
- Old distribution formula: MacBook (GCash savings) PHP 5,000 fixed + GoTrade (investing) PHP 1,000 fixed + GoTyme PHP 4,500 fixed + Maya PHP 1,000 fixed + Coins.ph 10% of salary + remainder split GCash wallet/RCBC. (Superseded by the 6-jar system Aug 8, 2026.)

This is a documentation mirror. Recalculate it from `index.html` after a material finance update.

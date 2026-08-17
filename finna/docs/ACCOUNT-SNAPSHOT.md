# Account Snapshot

**Source:** `index.html`
**As of:** Aug 16, 2026
**Status:** MAJOR RESTRUCTURE Aug 8: 6-jar MM system adopted (T. Harv Eker modified). Cash correction (Edge-confirmed): cash on hand 4,001.75 → 3,303.50, difference 698.25 = travel expenses booked (new Travel category). Total assets 54,202.72. Full 6-jar dashboard implemented (jar summary section, per-jar targets/status, account jar mapping). Edge decision: essential monthly expenses = ~₱20,000-21,000 (fixed ~13,000-13,400 + variable ~7,000-8,000), rent excluded (derived ₱7,700 unconfirmed, footnote only). Aug 14: lunch + coffee logged from GCash wallet (240 total); DeepSeek top-up corrected to two charges 332.19 + 132.88 (replaced 657.94) + cash withdrawal 2,000 from RCBC. Aug 15: LTSS company expenses - domain edgepossible.com 940.80 (RCBC) + Google Workspace 551.04 (GoTyme nec vault); reconciliation transfer 1,491.84 GCash bank → GCash wallet (LTSS-funded leg pending Edge confirmation). Aug 16: charity/tithes 500 from Coins.ph (GIVE jar). Aug 16: FFA settlement - 3,140.67 moved GCash wallet -> GCash bank (return of PLAY-day FFA money); 1,491.84 FFA-to-NEC settlement stays in wallet (NEC), settled per Edge. Aug 16: Aug 14 DeepSeek top-up corrected to 332.19 + 132.88 (was 657.94), RCBC up 192.87. Aug 16: CASH RECONCILIATION - physical count 1,574.75 vs books 2,422.50, short 847.75 booked as unrecorded spending (cat Reconciliation, shown as expense/minus per Edge request, cause forgotten, Edge-confirmed); cash 2,422.50 -> 1,574.75, assets 40,241.01 -> 39,393.26, August period expenses include the 847.75. Aug 16: DASHBOARD OVERHAUL - month-vs-month built (Jul vs Jun, income card removed - July income was reallocation not real income), receivables alerts live (RJ 315.75, JR 3,010 repays Aug 20), Emergency fund + Income history ARCHIVED (FFA = growth buffer), jar summary clickable with monthly movements, accounts flat with jar color accents + same-provider adjacency, spending-by-category REDESIGNED (ranked top-5 + jar strip + flags + watch line), monthly monitoring REDESIGNED (runway mode: 11 days of NEC at current burn + due-next list). Calendar automation live (8 events + daily sync cron). Aug 17: Edge confirmed the recurring subscription stack for planning: KEEP CapCut, Canva Pro, Google One, Claude Pro (charged), ChatGPT Plus (999 due Aug 19); Codex cut stays (Aug 18). Fixed total ~4,058/mo, matches DATA.subscriptions (docs update only, no ledger change). Aug 17 (Chairman ruling 00:25): PLAY = designated play-day expenses only (Aug 15) - coffee (Aug 16, 210) stays Food & dining/NEC, never re-derived. Aug 15 reclassification booked: 6 play expenses (bus 350, lunch 415, matcha 600, Beyblade 4,699, water 50, fare 25 = 6,139) now carry `jar: "PLAY"`; charity 100 carries `jar: "GIVE"`. PLAY shortfall settled: 6,139 spend vs 5,644.87 pool = 494.13 NEC-funded; remaining play money in wallet 870.87 - 494.13 = 376.74 net. No cash/Coins.ph movement booked (physical cash 1,574.75 intact).

## Accounts (6-jar structure)

| Account | Balance | Jar / Purpose |
|---|---:|---|
| GCash wallet | PHP 3,322.66 | **NEC jar** - spending |
| GCash bank | PHP 3,140.67 | **FFA jar** (10%) - growth buffer (was emergency fund) |
| RCBC savings | PHP 1,102.54 | **NEC jar** |
| Cash on hand | PHP 1,574.75 | **NEC jar** - cash |
| GoTyme nec vault | PHP 12,540.68 | **NEC jar** - GoTyme vault (housing/essentials) |
| GoTyme Professional Development (LTSS) | PHP 5,630.42 | **LTSS jar** (10%) |
| GoTyme My Go Save (PLAY) | PHP 0.00 | **PLAY jar** (10%) - includes ₱11.85 pre-existing legacy, never booked |
| Maya bank | PHP 5,630.42 | **EDU jar** (10%) |
| Maya wallet | PHP 0.00 | Distribution hub |
| GoTyme wallet | PHP 0.00 | Distribution hub |
| Coins.ph PHP | PHP 4,918.71 | **GIVE jar** - charity/tithes |
| GoTrade | PHP 1,000.00 | **FFA jar** - SPY (invested) |
| Tonik Bank | PHP 52.66 | Outside system |
| Alkansya | PHP 479.75 | Outside system - joins the jars later |

**Total assets:** PHP 39,393.26 (jars 38,860.85 + Tonik/Alkansya 532.41)
**Liabilities:** PHP 15,688.17 (SPayLater - next due Aug bill PHP 6,969.87 on Sep 15, 2026)
**Receivables:** PHP 3,327.75 (JR PHP 3,010.00 + RJ PHP 315.75 + Bryan PHP 2.00)
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
- Dashboard: new "6-jar summary" section shows per-jar balance vs target with OK/LOW/OVER status (tolerance 1.00 for split rounding). Jar balances: NEC 18,540.63 (LOW vs 28,152.08 - includes cash adjusted to physical count 1,574.75 on Aug 16), FFA 4,140.67 (LOW vs 5,630.42 - 3,140.67 returned to GCash bank Aug 16, 1,491.84 FFA-to-NEC settlement stays in wallet, SETTLED Aug 16), LTSS 5,630.42 (OK), EDU 5,630.42 (OK), PLAY 0.00 (Aug 15 PLAY-day fully attributed via `jar: "PLAY"` tags - 6,139 spent vs 5,644.87 pool, 494.13 NEC-funded shortfall SETTLED, net remaining play money 376.74 in wallet), GIVE 4,918.71 (OVER - pre-funded, expected; 100 charity paid from cash Aug 15 attributed to GIVE, 500 tithes from Coins.ph Aug 16).
- Jar attribution ruling (Aug 17, Chairman): PLAY = designated play-day expenses only; non-play-day coffee stays Food & dining/NEC, never re-derived. Per-transaction `jar` override supported in the ledger (see DATA-CONTRACT).

## Employment status - no income since Jul 24, 2026

**Edge resigned from his VA job Aug 3, 2026.** No income currently.

- **Now on monthly monitoring, not pay-period tracking** (as of Aug 3, 2026) - `DATA.monthly` replaced `DATA.salary`. Current: month Aug 1-31, 2026, day 16 of 31, resets Sep 1.
- **The semi-monthly distribution formula is paused** - nothing to distribute until income resumes; the 6-jar system replaces it.
- **`DATA.monthlySpending.wallets[].budget`** set Aug 7, 2026 from real ledger data (Edge decision): gcash 6,000, rcbc 3,000, maya 1,000, coins 1,000. Basis: Aug 1-7 actuals + fixed subscriptions + no-income reality. DeepSeek usage is volatile (₱1,319.55 in first 7 days) - flagged for mid-month rcbc recheck. `monthlyAllocation` donut still stale paycheck-era display, pending Edge decision.
- `DATA.salaryHistory` future placeholders removed - it's now a pure historical record ending Jul 25, 2026 (last actual paycheck).
- RCBC access restored Aug 11, 2026 (Edge-confirmed) - was temporarily inaccessible Aug 8, now fully usable. Balance unchanged at 4,508.41.
- Housing comes from the NEC jar (GoTyme nec vault). GoTyme buffer pre-restructure (₱4,527.84) now spread into NEC/LTSS/PLAY vaults.
- GCash wallet (NEC spending) at 6,981.33 is well above the ₱3,059 subscription threshold after the Aug 15 consolidation transfers - LOW alert cleared. RCBC savings at 1,102.54 after the Aug 14 DeepSeek correction + domain purchase; monitor (DeepSeek usage is variable and funds from RCBC, ChatGPT Plus 999 due Aug 19).
- Aug 9 Palawan expenses logged (Edge-confirmed): food 75 cash, dinner 130 cash, dinner 245 cash, internet (parents' subscription) 1,299 from GoTyme nec vault.
- Aug 10 expenses logged (Edge-confirmed): fare 100 cash, fare 200 cash, dinner 140 cash, lunch 320 from GoTyme nec vault, fare 95 cash.
- Aug 11 fare 252 from GoTyme nec vault logged (Edge-confirmed, en route to Manila).
- Aug 11 breakfast 203 from GCash wallet logged (Edge-confirmed, en route to Manila).
- Aug 11 cash expenses logged (Edge-confirmed): fare 195, food 45, fare 175, fare 13.
- Aug 11 lunch 210 cash logged (Edge-confirmed).
- Aug 12 lunch 210 GCash wallet logged (Edge-confirmed).
- Aug 12 loan to Bry 500 cash logged (Edge-confirmed) - receivable created then repaid next day, Bryan net stays 2.00.
- Aug 13 logged (Edge-confirmed): Bry loan repayment 500 GCash (income), laundry 192.50 GCash (Household), lunch 180 GCash (Food & dining).
- Aug 13 dinner 190 cash logged (Edge-confirmed).

## Category system - "Misc" retired Aug 3, 2026

Active categories: Food & dining, Groceries, Transport, **Travel** (added Aug 8 for the cash-correction expense), Load / comms, Subscriptions, Charity, Family, **Household**, **Loans**, **Debt payment**, **Investments**. `Misc` is no longer used for new transactions - see `finna/DATA-CONTRACT.md` for the full rule and category definitions. (June 2026 and part of July 2026's compiled `monthlyReports` still carry a frozen legacy `Misc` bucket that can't be itemized further - historical limitation, not an active category.)

## Pre-resignation reference (historical - last confirmed paycheck)

- Period: Jul 24, 2026 to Aug 10, 2026 (last pay period, cut short by the resignation)
- Most recent salary: PHP 17,354.21 (Jul 24 - notably reduced; may have been an early signal of the situation that led to resignation)
- Old distribution formula: MacBook (GCash savings) PHP 5,000 fixed + GoTrade (investing) PHP 1,000 fixed + GoTyme PHP 4,500 fixed + Maya PHP 1,000 fixed + Coins.ph 10% of salary + remainder split GCash wallet/RCBC. (Superseded by the 6-jar system Aug 8, 2026.)

This is a documentation mirror. Recalculate it from `index.html` after a material finance update.

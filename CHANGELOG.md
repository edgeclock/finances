# Finance Dashboard — Change Log

All updates to `index.html` DATA block are recorded here.
Format: Date · What changed · Why / Source

---

## Jul 6, 2026 — Spending & Transfers (Jun 30 – Jul 6)

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 30 | RCBC | +₱13.56 | RCBC interest | Income |
| Jun 30 | RCBC | −₱2.71 | Interest tax | Misc |
| Jul 1 | GCash | −₱1,315.12 | Medicine | Misc |
| Jul 1 | GCash | −₱2,915.00 | Papa money transfer | Family |
| Jul 1 | Cash | +₱3,000.00 | Papa transfer (cash received) | Income |
| Jul 1 | GCash | −₱300.00 | Canva Pro | Subscriptions |
| Jul 1 | GCash | −₱359.00 | CapCut | Subscriptions |
| Jul 1 | GCash | −₱5,015.00 | Lent to Sweet | Misc |
| Jul 5 | Coins.ph | −₱500.00 | Tithes | Charity |
| Jul 5 | Cash | −₱26.00 | Fare | Transport |
| Jul 5 | Cash | −₱27.50 | Medicine | Misc |
| Jul 6 | RCBC→GCash | ₱2,000.00 | Transfer (balance adjust) | — |
| Jul 6 | GCash | −₱50.00 | Breakfast | Food & dining |

**DATA changes:**
- 13 entries added to `transactions[]` (12 expense/income + 1 transfer as balance adjust)
- GCash wallet: ₱10,878.95 → ₱2,924.83 — **⚠ BELOW ₱3,059 sub threshold**
- RCBC savings: ₱5,610.75 → ₱3,621.60 (interest +₱10.85, transfer out −₱2,000)
- Cash on hand: ₱1,292.00 → ₱4,238.50 (+₱3,000 papa, −₱53.50 spending)
- Coins.ph PHP: ₱4,485.64 → ₱3,985.64 (−₱500 tithes)
- `dayOfPeriod`: 5 → 11 (Jul 6)
- `lastUpdated`: "Jun 30, 2026" → "Jul 6, 2026"
- Receivables: added Sweet ₱5,015.00 (due Jul 10) → total ₱5,265.00 (JR + Sweet)
- upcomingPayments: removed Canva/CapCut (paid), Google One marked urgent (due Jul 7)
- Monitoring: added "Google One due Jul 7", "Sweet owes ₱5,015" alerts

---

## Jun 30, 2026 — GCash Distribution + Spending

**Agent:** Finna (Claude Code)
**Source:** Edge confirmed transfers and spending

| Transfer | Amount | TF | Note |
|---|---|---|---|
| RCBC → GCash wallet | ₱14,464.09 | ₱10 | Includes ₱10,000 MacBook + ₱4,464.09 wallet alloc |
| GCash wallet → GCash savings | ₱10,000.00 | — | MacBook fund top-up |

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 30 | GCash | ₱166.25 | Laundry | Misc |
| Jun 30 | GCash | ₱748.00 | Lunch | Food & dining |
| Jun 30 | GCash | ₱480.50 | Meds (sore throat) | Misc |
| Jun 30 | Cash | ₱160.00 | Lunch | Food & dining |
| Jun 30 | Cash | ₱392.00 | Lunch | Food & dining |
| Jun 30 | Cash | ₱240.00 | Lunch | Food & dining |

**DATA changes:**
- 6 entries added to `transactions[]`
- GCash wallet: ₱7,809.61 → ₱10,878.95 (+₱14,464.09 − ₱10,000 − ₱1,394.75 spending)
- GCash savings: ₱21,061.49 → ₱31,061.49 (+₱10,000.00)
- RCBC savings: ₱20,411.84 → ₱5,937.75 (−₱14,464.09 − ₱10.00 TF)
- Cash on hand: ₱2,246.00 → ₱1,454.00 (−₱792.00)

---

## Jun 30, 2026 — Salary Distribution (Partial)

**Agent:** Finna (Claude Code)
**Source:** Edge confirmed transfers

| Transfer | Amount | TF | RCBC out |
|---|---|---|---|
| RCBC → Maya wallet | ₱1,642.54 | ₱10 | ₱1,652.54 |
| RCBC → Coins.ph | ₱2,285.64 | ₱10 | ₱2,295.64 |
| RCBC → GoTyme savings | ₱4,500.00 | ₱10 | ₱4,510.00 |
| **Total** | | | **₱8,458.18** |

**DATA changes:**
- RCBC savings: ₱28,870.02 → ₱20,411.84 (−₱8,458.18)
- Maya wallet: ₱0.00 → ₱1,642.54 (+₱1,642.54)
- Coins.ph PHP: ₱2,200.00 → ₱4,485.64 (+₱2,285.64)
- GoTyme savings: ₱4,500.00 → ₱9,000.00 (+₱4,500.00)

Note: Coins.ph received ₱2,285.64 (reduced from formula ₱2,785.64 — ₱500 charity pre-paid from RCBC on Jun 29).
Pending: GCash savings (+₱10,000) and GCash wallet (+₱4,464.09) not yet transferred.

---

## Jun 30, 2026 — Backdated Jun 25 Entries

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 25 | GCash | ₱108.00 | Coffee | Food & dining |
| Jun 25 | GCash | ₱130.00 | Milk | Groceries |
| Jun 25 | GCash | ₱80.00 | Breakfast | Food & dining |

**DATA changes:**
- 3 entries added to `transactions[]`
- GCash wallet: ₱8,127.61 → ₱7,809.61 (−₱318.00)

---

## Jun 30, 2026 — Correction: Jun 26 Coffee wallet

**Agent:** Finna (Claude Code)
**Source:** Edge correction

- `transactions[]` Jun 26 Coffee ₱185: wallet `gcash` → `cash`
- GCash wallet: ₱7,942.61 → ₱8,127.61 (+₱185.00)
- Cash on hand: ₱2,431.00 → ₱2,246.00 (−₱185.00)

---

## Jun 29, 2026 — Spending Entries

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 29 | RCBC | ₱500.00 | Charity (via RCBC) | Charity |
| Jun 29 | GCash | ₱5.00 | TikTok coins | Misc |
| Jun 29 | RCBC | ₱322.00 | RJ45 cable (Shopee) | Misc |

**DATA changes:**
- 3 entries added to `transactions[]`
- GCash wallet: ₱7,947.61 → ₱7,942.61 (−₱5.00)
- RCBC savings: ₱29,692.02 → ₱28,870.02 (−₱500.00 − ₱322.00)

**Note — Charity cross-wallet:** The ₱500 charity was paid from RCBC but counts against the Coins.ph allocation. When distributing, Coins.ph receives ₱2,285.64 (₱2,785.64 − ₱500) instead of the formula amount.

---

## Jun 30, 2026 — Maya Wallet Sweep (Pre-Distribution)

**Agent:** Finna (Claude Code)
**Source:** Edge confirmed transfer via app

**DATA changes:**
- Maya wallet: ₱1,838.35 → ₱0.00 (swept to savings)
- Maya savings: ₱3.28 → ₱1,841.63 (+₱1,838.35)
- `dayOfPeriod`: 4 → 5 (Jun 30)
- `lastUpdated`: "Jun 27, 2026" → "Jun 30, 2026"

---

## Jun 27, 2026 — Period Reset + New Period Entries (Jun 25–Jul 10)

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

### Old period archive — Jun 10–25 final state
Old period transactions[] cleared. Complete Jun 10–24 spending is preserved in CHANGELOG entries above. Final old-period balances before reset:
- Total spent (Jun 10–24): ₱16,051.71 + ₱140 + ₱13 + ₱200 = ₱16,404.71
- Jun 24 extras (old period, balance-only, not shown in dashboard): Laundry ₱140 GCash, Fare ₱13 Cash, Dinner ₱200 Cash

### New period — Jun 25 salary

| Field | Value |
|---|---|
| Salary received | ₱27,856.36 (RCBC) |
| Period | Jun 25 – Jul 10 |
| Note | Salary lower than usual ₱37,000. Distribution to wallets pending Edge confirmation. |

### New period spending entries

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 26 | GCash | ₱325.00 | Milk | Groceries |
| Jun 26 | GCash | ₱185.00 | Coffee | Food & dining |
| Jun 26 | GCash | ₱150.00 | Shirt | Misc |
| Jun 27 | Cash | ₱13.00 | Fare | Transport |
| Jun 27 | Cash | ₱67.00 | Fare | Transport |
| Jun 27 | Cash | ₱13.00 | Fare | Transport |
| Jun 27 | Coins.ph | ₱500.00 | Tithes (Victory) | Charity |
| Jun 27 | Cash | ₱13.00 | Fare | Transport |
| Jun 27 | GCash | ₱170.00 | Milk | Groceries |

**DATA changes:**
- `transactions[]` reset for new period (10 entries: 1 income + 9 expenses)
- GCash wallet: ₱8,917.61 → ₱7,947.61 (−₱140 Jun24 laundry, −₱660 Jun26, −₱170 Jun27)
- RCBC savings: ₱1,835.66 → ₱29,692.02 (+₱27,856.36 salary received)
- Cash on hand: ₱2,750.00 → ₱2,431.00 (−₱213 Jun24, −₱106 Jun27)
- Coins.ph PHP: ₱2,700.00 → ₱2,200.00 (−₱500 tithes Jun27)
- `salary.recent`: ₱37,000 → ₱27,856.36
- `salary.periodStart`: "Jun 10" → "Jun 25"
- `salary.periodEnd`: "Jun 25" → "Jul 10"
- `salary.dayOfPeriod`: 14 → 4 (Jun 29)
- Wallet budgets updated to formula: GCash ₱3,031 · RCBC ₱5,897 · Maya ₱1,643 · Coins.ph ₱2,786
- `lastUpdated`: "Jun 24, 2026" → "Jun 27, 2026"

---

## Jun 24, 2026 — Spending Entries (Jun 22 + Jun 24)

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 22 | GCash | ₱95.00 | Breakfast | Food & dining |
| Jun 22 | RCBC | ₱1,735.87 | Groceries | Groceries |
| Jun 22 | Cash | ₱150.00 | Groceries | Groceries |
| Jun 24 | GCash | ₱80.00 | Breakfast | Food & dining |

**Transfer (not in transactions[]):**
- RCBC → Cash: ₱500.00 (ATM withdrawal Jun 22)

**DATA changes:**
- 4 entries added to `transactions[]`
- GCash wallet: ₱9,092.61 → ₱8,917.61 (−₱95.00 −₱80.00)
- RCBC savings: ₱4,071.53 → ₱1,835.66 (−₱1,735.87 expense −₱500.00 transfer)
- Cash on hand: ₱2,400.00 → ₱2,750.00 (+₱500.00 transfer −₱150.00 expense)
- `dayOfPeriod`: 12 → 14 (Jun 24)
- `lastUpdated`: "Jun 22, 2026" → "Jun 24, 2026"

---

## Jun 22, 2026 — Amount and description corrections

**Agent:** Finna (Claude Code)
**Source:** Edge corrected two transaction entries

| Date | Wallet | Field | Before | After |
|---|---|---|---|---|
| Jun 17 | GCash | Amount (Groceries) | ₱265.50 | ₱256.50 |
| Jun 14 | RCBC | Description | "RCBC subscriptions (CapCut + Gemini API)" | "Gemini API (OpenClaw)" |

**DATA changes:**
- GCash wallet: ₱9,083.61 → ₱9,092.61 (+₱9.00 correction)
- Total spent: ₱13,999.84 → ₱13,990.84
- Note: CapCut is a separate charge due Jul 3 — it was NOT part of the Jun 14 RCBC bill

---

## Jun 22, 2026 — Data corrections & system updates

**Agent:** Finna (Claude Code)
**Source:** Edge clarified 14 open inconsistencies

**Transaction corrections:**
- `Support (father)` Jun 18: cat `Misc` → `Family`
- `Cake` Jun 21: desc updated to `Cake (Father's Day)`, cat `Food & dining` → `Family`
- `RCBC subscription` Jun 14: desc updated to `RCBC subscriptions (CapCut + Gemini API)`

**DATA changes:**
- Added `"Family"` category to `categoryOrder`
- Added `receivables: { jr: 250.00 }` (lent Jun 15, pending repayment)
- Maya wallet budget: ₱4,800 → ₱5,300 (per paycheck formula: salary−MacBook÷2−rent−charity)
- `monthlyAllocation`: "Personal dev" renamed "Personal funds", amount ₱9,600 → ₱10,600
- Bryan (bike) added back to `upcomingPayments` — due Jul 21 placeholder
- `dayOfPeriod`: 11 → 12 (Jun 22)
- `lastUpdated`: "Jun 21, 2026" → "Jun 22, 2026"

**System updates:**
- `finna-log` SKILL.md: added Family category mapping; charity mapping tightened to Coins.ph only
- `finna-check` SKILL.md: valid cats updated to include `"Family"`
- Vault files updated: Maya-Wallet.md, GoTyme-Savings.md, Coins-PHP.md, Alkansya.md, RCBC-Savings.md, INDEX.md

---

## Jun 14, 2026 — Initial Setup

**Agent:** Finna (Claude Code)

- Built `index.html` from scratch — full finance dashboard with Chart.js
- Entered all account balances from screenshots provided by Edge
- Set salary period: Jun 10 – Jun 25, ₱37,000 paycheck
- Set `dayOfPeriod: 4` (4 days into period)
- Entered full SPayLater schedule (8 bills, Jun–Jan)
- Entered upcoming payments (Brian, Canva, CapCut, Google One, Claude Pro, SPayLater)
- Set MacBook Pro M5 goal: ₱145,000 by Dec 12, 2026

**Balances set (post-distribution, Jun 14):**
| Account | Balance |
|---|---|
| GCash wallet | ₱12,878.36 |
| GCash savings | ₱21,061.49 |
| RCBC savings | ₱9,646.62 |
| Maya wallet | ₱4,693.35 |
| GoTyme savings | ₱4,500.00 |
| Coins.ph PHP | ₱3,200.00 |
| Bitget BTC | ₱12,844.66 |
| Maya savings | ₱3.28 |
| GoTyme wallet | ₱0.00 |
| Cash on hand | ₱3,270.00 |
| **Net worth** | **₱40,364.69** |

---

## Jun 14, 2026 — RCBC Subscription Charge

**Agent:** Finna (Claude Code)
**Source:** Edge manually reported

- RCBC savings: ₱9,646.62 → ₱8,080.53 (−₱1,566.09)
- `periodSpending.spentRCBC`: 0 → ₱1,566.09
- `categories.Subscriptions.rcbc`: 0 → ₱1,566.09
- Note: RCBC is Edge's only Visa card — some subscriptions charge directly there

---

## Jun 15, 2026 — Budget Section Expanded

**Agent:** Finna (Claude Code)

- `periodSpending` refactored: old `budgetGCash/spentGCash` fields replaced with `wallets[]` array
- Added Maya wallet (budget ₱4,800) and Coins.ph PHP (budget ₱3,700) as tracked wallets
- `categories` updated: added `maya` and `coins` keys per category
- Budget vs actual card now shows per-wallet daily pace, projected end-of-period, and mini category breakdown bars
- Category chart updated to 5 colors: GCash, RCBC, Maya, Coins.ph, Cash
- `dayOfPeriod`: 4 → 5 (Jun 15)
- `lastUpdated`: "Jun 14, 2026" → "Jun 15, 2026"

---

## Jun 15, 2026 — Spending Entries

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Wallet | Amount | Description | Category |
|---|---|---|---|
| GCash | ₱250 | Lent to cousin JR | Misc |
| GCash | ₱210 | Laundry payment | Misc |
| Maya | ₱1,045 | Play ticket (watching Friday) | Misc |

**DATA changes:**
- GCash wallet spent: 0 → ₱460 (250 + 210)
- Maya wallet spent: 0 → ₱1,045
- `categories.Misc.gcash`: 0 → ₱460
- `categories.Misc.maya`: 0 → ₱1,045
- GCash wallet balance: ₱12,878.36 → ₱12,418.36
- Maya wallet balance: ₱4,693.35 → ₱3,648.35
- **Net worth updated: ₱38,798.60 → ₱37,293.60**

> ⚠️ Note: ₱250 lent to JR is a receivable — JR owes it back. Currently tracked as Misc spending. Reverse when repaid.

---

## Jun 15, 2026 — Cash Spending Entries

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Wallet | Amount | Description | Category |
|---|---|---|---|
| Cash | ₱210 | Meal | Food & dining |
| Cash | ₱200 | House drinking water | Groceries |

**DATA changes:**
- `cashLog`: added 2 entries (Jun 15)
- `categories["Food & dining"].cash`: 0 → ₱210
- `categories["Groceries"].cash`: 0 → ₱200
- Cash on hand balance: ₱3,270.00 → ₱2,860.00 (−₱410)
- **Net worth updated: ₱37,293.60 → ₱36,883.60**

---

## Jun 21, 2026 — Spending Entries (missed)

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 20 | GCash | ₱201.25 | Laundry payment | Misc |
| Jun 21 | Coins.ph | ₱500.00 | Tithes (Victory church) | Misc |

**DATA changes:**
- 2 entries added to `transactions[]`
- GCash wallet: ₱9,284.86 → ₱9,083.61 (−₱201.25)
- Coins.ph PHP: ₱3,200.00 → ₱2,700.00 (−₱500.00)

---

## Jun 21, 2026 — Spending Entries (Jun 19–21)

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 19 | Cash | ₱190.00 | Water | Groceries |
| Jun 19 | Cash | ₱200.00 | Coffee & bread (for friends) | Food & dining |
| Jun 19 | GCash | +₱200.00 | Friends repayment | Income |
| Jun 19 | Cash | ₱210.00 | Lunch | Food & dining |
| Jun 20 | Cash | ₱75.00 | Breakfast | Food & dining |
| Jun 20 | Cash | ₱140.00 | Lunch | Food & dining |
| Jun 20 | GCash | ₱1,000.00 | Dinner | Food & dining |
| Jun 21 | Cash | ₱13.00 | Fare to church | Transport |
| Jun 21 | — | ₱3,000.00 | RCBC→Cash withdrawal (transfer, not expense) | — |
| Jun 21 | Cash | ₱530.00 | Cake | Food & dining |
| Jun 21 | Cash | ₱13.00 | Fare to terminal | Transport |
| Jun 21 | Cash | ₱458.00 | Bus fare | Transport |
| Jun 21 | Cash | ₱1,000.00 | Bryan bike payment | Misc |
| Jun 21 | RCBC | ₱1,009.00 | Lunch (Bryan & James) | Food & dining |
| Jun 21 | Maya | ₱1,810.00 | Shoes | Misc |
| Jun 21 | GCash | ₱390.00 | Coffee (Bryan) | Food & dining |
| Jun 21 | Cash | ₱36.00 | Fare to Market Market | Transport |
| Jun 21 | GCash | ₱307.00 | Fare to Terminal 2 | Transport |

**DATA changes:**
- 17 entries added to `transactions[]` (16 expenses + 1 income)
- GCash wallet: ₱10,781.86 → ₱9,284.86 (−₱1,497.00 net)
- Cash on hand: ₱2,060.00 → ₱2,195.00 (+₱135.00 net after ₱3,000 RCBC withdrawal)
- RCBC savings: ₱8,080.53 → ₱4,071.53 (−₱3,000 withdrawal + −₱1,009 lunch)
- Maya wallet: ₱3,648.35 → ₱1,838.35 (−₱1,810.00)
- Bike liability: ₱2,000 → ₱1,000 (Bryan ₱1,000 paid)
- Bryan bike removed from upcoming payments (paid early)
- `dayOfPeriod`: 8 → 11 (Jun 21)
- `lastUpdated`: "Jun 18, 2026" → "Jun 21, 2026"

---

## Jun 18, 2026 — Spending Entries

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 18 | Cash | ₱210.00 | Meal | Food & dining |
| Jun 18 | GCash | ₱1,000.00 | Support (father) | Misc |

**DATA changes:**
- 2 entries added to `transactions[]`
- Cash on hand: ₱2,270.00 → ₱2,060.00 (−₱210.00)
- GCash wallet: ₱11,781.86 → ₱10,781.86 (−₱1,000.00)

---

## Jun 18, 2026 — Date Correction + dayOfPeriod Update

**Agent:** Finna (Claude Code)

- `transactions[]` Jun 16 Meal (cash, ₱200) corrected to Jun 17 — "yesterday" was spoken on Jun 18, not Jun 17
- `lastUpdated`: "Jun 17, 2026" → "Jun 18, 2026"
- `dayOfPeriod`: 7 → 8 (Jun 18 − Jun 10 = 8)

> Root cause: date inference used the wrong "today." System context must be checked before resolving "yesterday."

---

## Jun 17, 2026 — Spending Entries (Jun 16–17)

**Agent:** Finna (Claude Code)
**Source:** Edge verbally reported

| Date | Wallet | Amount | Description | Category |
|---|---|---|---|---|
| Jun 16 | Cash | ₱390.00 | Meals | Food & dining |
| Jun 16 | GCash | ₱101.00 | Mobile load (father) | Load / comms |
| Jun 16 | GCash | ₱210.00 | Laundry payment | Misc |
| Jun 16 | Cash | ₱200.00 | Meal | Food & dining |
| Jun 17 | GCash | ₱265.50 | Groceries | Groceries |
| Jun 17 | GCash | ₱60.00 | Coffee powder | Groceries |

**DATA changes:**
- 4 entries added to `transactions[]`
- GCash wallet balance: ₱12,418.36 → ₱11,781.86 (−₱636.50)
- Cash on hand balance: ₱2,860.00 → ₱2,270.00 (−₱590.00)
- `dayOfPeriod`: 5 → 7 (Jun 17)
- `lastUpdated`: "Jun 15, 2026" → "Jun 17, 2026"

---

## Jun 15, 2026 — Transaction Log + Data Refactor

**Agent:** Finna (Claude Code)

- Replaced `cashLog[]` and manual `categories{}` with unified `transactions[]` array
- Replaced manual `spent` field on wallets with computed values (derived from `transactions[]`)
- `categoryOrder` array replaces `categories` object as just an ordering list
- Added **Transaction Log** section to dashboard — shows all expenses and income, newest first, with category pill + wallet chip + color-coded amounts
- `cats{}` and wallet `spent` now computed in the COMPUTED section from `transactions[]`
- **Single source of truth:** only `transactions[]` needs updating when adding spend or income

**How to add a transaction going forward:**
```javascript
{ date: "Jun 16", desc: "description", cat: "Misc", amount: 150.00, wallet: "gcash", type: "expense" }
```
- `cat` must match a value in `categoryOrder` (or `"Income"` for income)
- `wallet`: `"gcash"` | `"rcbc"` | `"maya"` | `"coins"` | `"cash"`
- `type`: `"expense"` | `"income"`
- Still manually update `accounts[x].balance` when balance changes

---

## Notes for Other AI Agents

- **Dashboard file:** `D:\Personal\Finances\index.html`
- **Data block location:** top of `<script>` tag, `const DATA = {...}`
- **Update pattern:** Add to `transactions[]` only — wallet spent and categories auto-compute. Still manually update `accounts[x].balance`.
- **Period resets:** Every 10th and 25th — clear `transactions[]` (keep income entry), reset `dayOfPeriod`, update `accounts[]` balances from screenshots
- **Handoff doc:** `D:\Personal\Finances\Finna Handoff.md` — full financial context
- **Memory files:** `C:\Users\PC\.claude\projects\D--Personal-Finances\memory\`

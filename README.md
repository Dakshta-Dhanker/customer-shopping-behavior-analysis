# 🛍️ Customer Shopping Behavior Analysis
### End-to-End Data Analytics Project | Python · PostgreSQL · Power BI

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white)

---

## 📌 Project Overview

A leading retail company wanted to better understand its customers' shopping behavior to improve sales, customer satisfaction, and long-term loyalty. This project performs a **full-stack, end-to-end analytics workflow** — from raw data cleaning to executive-ready insights and an interactive dashboard.

> **Core Business Question:** *"How can the company leverage consumer shopping data to identify trends, improve customer engagement, and optimize marketing and product strategies?"*

---

## 📊 Key Results at a Glance

| Metric | Value |
|--------|-------|
| 💰 Total Revenue Analyzed | ₹21,71,90,250 (~₹217M) |
| 👥 Total Customers | 8,000 |
| 📦 Total Transactions | 8,000 records |
| 🔁 Repeat Purchase Rate | 42% |
| 💳 Avg Order Value | ₹27,149 |
| 🏆 Champions Revenue Share | ~82% of total revenue |
| 🏷️ Discount Usage Rate | 40.2% |
| ⭐ Avg Review Rating | 3.97 / 5.0 |

---

## 🗂️ Repository Structure

```
customer-shopping-behavior-analysis/
│
├── data/
│   ├── Customer_retail_data.csv          # Raw dataset (8,000 rows × 19 cols)
│   └── cleaned_customer.csv             # Python-cleaned dataset (21 cols)
│
├── notebooks/
│   └── Customer_Behavior_Analysis.ipynb  # Python EDA & data cleaning
│
├── sql/
│   ├── Customer_analysis.sql             # 16 business intelligence queries
│   └── RFM_Analysis.sql                  # RFM + Cohort Retention + CLV
│
├── dashboard/
│   └── customer_behavior_analysis.pbix   # Power BI 3-page dashboard
│
├── report/
│   └── Customer_Shopping_Behavior_Report.docx
│
└── README.md
```

---

## 🛠️ Project Workflow

```
Raw CSV (8,000 rows × 19 cols)
            │
            ▼
┌───────────────────────┐
│   Python — Jupyter    │  pandas · matplotlib · seaborn · SQLAlchemy
│   · Data Cleaning     │  Missing values · Feature Engineering
│   · EDA               │  age_group · purchase_frequency_days
│   · DB Load           │  → Loaded into PostgreSQL
└──────────┬────────────┘
           │
           ▼
┌───────────────────────┐
│   PostgreSQL (SQL)    │  16 Business Queries
│   · Business Queries  │  + RFM Segmentation
│   · RFM Model         │  + Cohort Retention Analysis
│   · Cohort Analysis   │  + Customer Lifetime Value (Top 20)
│   · CLV               │
└──────────┬────────────┘
           │
           ▼
┌───────────────────────┐
│   Power BI            │  3-Page Interactive Dashboard
│   · Executive Overview│  5 Cross-Page Slicers
│   · Behavior Drivers  │  DAX Measures · RFM Visuals
│   · Advanced Analytics│
└───────────────────────┘
```

---

## 🐍 Phase 1 — Python: Data Cleaning & EDA

**File:** `notebooks/Customer_Behavior_Analysis.ipynb`

### Dataset Overview
- **Raw:** 8,000 rows × 19 columns
- **Cleaned:** 8,000 rows × 21 columns (2 new engineered features)

### Missing Values Handled

| Column | Missing Count | % Missing | Treatment |
|--------|--------------|-----------|-----------|
| Size | 5,479 | 68.5% | Imputed / handled |
| Promo Code Used | 150 | 1.9% | Filled → dropped (redundant with discount_applied) |
| Review Rating | 120 | 1.5% | Median imputed per product category |
| Shipping Type | 100 | 1.25% | Mode imputed per category |

### Feature Engineering

| New Column | Logic | Distribution |
|------------|-------|-------------|
| `age_group` | Age bins | Young Adult: 2,117 · Middle-aged: 2,098 · Adult: 1,923 · Senior: 1,862 |
| `purchase_frequency_days` | Frequency label → numeric days | Monthly (30d): 2,787 · Quarterly (90d): 1,642 · Bi-Weekly (14d): 1,570 · Weekly (7d): 1,239 · Annually (365d): 762 |

### Other Cleaning Steps
- Renamed all 19 columns to `snake_case` for SQL compatibility
- Verified `discount_applied` and `promo_code_used` were redundant → `promo_code_used` dropped
- No duplicate `customer_id` entries found
- Connected Python to PostgreSQL via **SQLAlchemy** and loaded cleaned DataFrame into `customer_behavior.customer`

---

## 🗄️ Phase 2 — SQL: Business Intelligence Analysis

**Files:** `sql/Customer_analysis.sql` · `sql/RFM_Analysis.sql`

### 16 Business Queries — Results

| # | Business Question | Key Finding |
|---|-------------------|-------------|
| Q1 | Revenue by Gender | Female: ₹114.2M (4,180 customers) · Male: ₹102.9M (3,820 customers) |
| Q2 | High-spending discount users | Customers who used discounts yet still spent above avg ₹27,149 |
| Q3 | Top 5 products by avg rating | Headphones: 4.00 · Boots: 4.00 · Backpack: 3.99 · Sneakers: 3.98 · Laptop: 3.98 |
| Q4 | Subscriber vs. non-subscriber spend | Subscribers: ₹27,319 avg · Non-subscribers: ₹27,058 avg — negligible ₹261 difference |
| Q5 | Top 5 discount-dependent products | Jeans: 42.97% · Boots: 42.01% · Jacket: 41.30% · Headphones: 41.14% · Watch: 40.28% |
| Q6 | Revenue by Age Group | Middle-aged: ₹57.3M · Young Adult: ₹57.2M · Adult: ₹52M · Senior: ₹50.6M |
| Q7 | Factors driving repeat purchases | Subscribed + discount users show highest avg repeat purchase behavior |
| Q8 | Rating vs. spending correlation | Avg rating consistent ~3.97 across all spend levels — weak correlation |
| Q9 | Seasonal customer behavior | Winter: ₹27,730 avg (highest) · Summer: ₹26,379 (lowest) · All seasons within 5% |
| Q10 | Subscriber behavioral profile | 2,763 subscribers · 5,237 non-subscribers · Similar avg ratings both groups |
| Q11 | Loyalty segmentation | Moderately Loyal (10–19 purchases): 4,270 · Low Engagement (<10): 3,689 · Highly Loyal (20+): only 41 |
| Q12 | Promo code impact on loyalty | No promo: 10.01 avg repeat · With promo: 10.04 — promo codes do NOT build loyalty |
| Q13 | Category loyalty scores | Clothing: 10.05 · Footwear: 10.03 · Electronics: 9.99 · Accessories: 9.97 — all nearly equal |
| Q14 | Payment method & customer maturity | Cash users: oldest avg age 44.07 · Google Pay: youngest 42.85 |
| Q15 | High spenders vs. engagement | Low (<₹20K): 5,465 · High (₹50K+): 1,581 · Medium (₹20–50K): 954 |
| Q16 | Purchase frequency alignment | Monthly buyers (2,787): largest and most frequent segment |

### Advanced SQL Models

#### 🏅 RFM Segmentation
Customers scored on **Recency**, **Frequency**, and **Monetary** value using `NTILE(4)` window functions. Combined scores mapped to 4 segments:

```sql
WITH rfm_scores AS (
    SELECT *,
        NTILE(4) OVER (ORDER BY last_purchase_date DESC) AS recency_score,
        NTILE(4) OVER (ORDER BY frequency DESC)          AS frequency_score,
        NTILE(4) OVER (ORDER BY monetary DESC)           AS monetary_score
    FROM rfm_base
)
-- Champions (10–12) | Loyal Customers (7–9) | Potential (4–6) | At Risk (≤3)
```

| Segment | Score | Strategy |
|---------|-------|----------|
| Champions | 10–12 | VIP rewards & early access |
| Loyal Customers | 7–9 | Upsell & cross-sell |
| Potential Loyalists | 4–6 | Targeted promotions |
| At Risk | ≤ 3 | Win-back campaigns |

#### 📅 Cohort Retention Analysis
Customers grouped by first purchase month using `DATE_TRUNC`. Monthly activity tracked via self-JOIN to measure retention decay over time — identifies which acquisition cohorts retain customers most effectively.

#### 💰 Customer Lifetime Value (CLV)
Top 20 customers ranked by `SUM(purchase_amount)`. Each record shows: total orders, cumulative lifetime value, and avg order value — enabling precision VIP targeting.

---

## 📊 Phase 3 — Power BI: Interactive Dashboard

**File:** `dashboard/customer_behavior_analysis.pbix`

**3-page interactive dashboard** with 5 cross-page slicers: Year · Gender · Age Group · Category · Location

### Page 1 — Executive Overview

| KPI | Value |
|-----|-------|
| Total Revenue | ₹217M |
| Total Customers | 8,000 |
| Avg Order Value | ₹27,149 |
| Avg Purchase Interval | 68 days |
| Avg Previous Purchases | 10 |

**Visuals:** Monthly Revenue Trend (2024 vs 2025) · Revenue by Product Category · Customer Segment Distribution (Donut) · Revenue by Customer Segment

### Page 2 — Behavior Drivers

| KPI | Value |
|-----|-------|
| Discount Usage Rate | 40.2% |
| Avg Customer Rating | 3.97 / 5 |
| Discounted Revenue | ₹85.4M vs ₹131.8M non-discounted |

**Visuals:** Purchase Frequency by Age Group · Rating Impact on Revenue · Seasonal Behavior · Shipping Preference by Segment · Payment Behavior Analysis (Credit Card: 40.7%) · Discount Impact on Revenue

### Page 3 — Advanced Analytics

| KPI | Value |
|-----|-------|
| Repeat Purchase Rate | 42% |
| Avg Recency | 434 days |
| Avg Customer Value | ₹27K |

**Visuals:** Customer Spending by Recency · Purchase Interval Distribution by RFM Segment · Customer Engagement Scatter (Recency vs Frequency)

---

## 💡 Top Business Insights

1. **Female customers contribute more revenue** — ₹114.2M vs Male ₹102.9M, despite being only slightly more in count
2. **Champions (39%) drive ~82% of revenue** — classic Pareto; protecting this segment is the #1 business priority
3. **Discounts hurt margins** — 40.2% discount rate generates only ₹85.4M vs ₹131.8M from non-discounted purchases
4. **Promo codes ≠ loyalty** — avg repeat purchases nearly identical with/without promo (10.04 vs 10.01)
5. **Subscription program underperforms** — only ₹261 avg spend difference between subscribers and non-subscribers
6. **Electronics drives 75% of revenue** — ₹163M out of ₹217M; heavily concentrated in one category
7. **Only 41 Highly Loyal customers** out of 8,000 — loyalty program urgently needs strengthening
8. **Recency is the #1 spend predictor** — 0–30 day recency customers consistently show the highest spend

---

## ✅ Business Recommendations

| # | Recommendation | Based On |
|---|----------------|----------|
| 1 | Launch VIP program for Champions | 39% of customers = ~82% of revenue |
| 2 | Win-back campaigns for At Risk RFM segment | Recency = strongest predictor of spend |
| 3 | Convert Potential Loyalists (41% of base) | Largest under-engaged segment — biggest growth lever |
| 4 | Redesign subscription program with exclusive perks | ₹261 spend difference is not meaningful |
| 5 | Reduce discount dependency on Jeans, Boots, Jacket | 42–43% discount rates compress gross margins |
| 6 | Use promo codes for acquisition only | Near-zero loyalty lift proven by data |
| 7 | Focus on Electronics + Middle-aged / Young Adults | Top revenue category + top revenue age groups |
| 8 | Amplify Winter season marketing | Highest avg spend season at ₹27,730 |

---

## 🚀 How to Run This Project

### Step 1: Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/customer-shopping-behavior-analysis.git
cd customer-shopping-behavior-analysis
```

### Step 2: Run Python EDA
```bash
pip install pandas matplotlib seaborn sqlalchemy psycopg2
jupyter notebook notebooks/Customer_Behavior_Analysis.ipynb
```

### Step 3: PostgreSQL Setup & SQL Analysis
```bash
# Create the database
createdb customer_behavior

# Run Python notebook first to load cleaned data into PostgreSQL
# Then execute the SQL files:
psql -d customer_behavior -f sql/Customer_analysis.sql
psql -d customer_behavior -f sql/RFM_Analysis.sql
```

### Step 4: Power BI Dashboard
```
1. Open dashboard/customer_behavior_analysis.pbix in Power BI Desktop
2. Update PostgreSQL connection string with your local credentials
3. Click Refresh All
4. Explore all 3 pages using the 5 cross-page slicers
```

---

## 📦 Tech Stack

| Tool | Purpose |
|------|---------|
| Python 3.x | Data cleaning, EDA, feature engineering |
| pandas | Data manipulation & transformation |
| matplotlib / seaborn | EDA visualizations |
| SQLAlchemy | Python → PostgreSQL connection |
| PostgreSQL | Data storage + all SQL analysis |
| SQL (PostgreSQL dialect) | 16 queries + RFM + Cohort + CLV |
| Power BI Desktop | 3-page interactive dashboard |
| DAX | Custom KPI measures & calculated columns |
| Jupyter Notebook | Development & documentation environment |

---

## 📄 Dataset Info

| Attribute | Detail |
|-----------|--------|
| Raw Records | 8,000 rows × 19 columns |
| Cleaned Records | 8,000 rows × 21 columns |
| Product Categories | Clothing · Electronics · Accessories · Footwear |
| Unique Products | 10 items |
| Unique Locations | 8 regions |
| Date Range | 2024 – 2025 |
| Purchase Amount Range | ₹1,245 – ₹1,24,251 |

---

⭐ *If you found this project helpful, consider starring the repo!*

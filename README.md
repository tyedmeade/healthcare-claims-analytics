# Healthcare Claims Analytics (SQL + Power BI)

Power BI dashboards built on top of PostgreSQL reporting views to monitor **reimbursement performance**, **payment timeliness**, and **revenue leakage** across the claims lifecycle.

## Overview
This project analyzes healthcare **claims and payments** data to answer common revenue-cycle questions:
- Are claims being reimbursed fully and on time?
- Where are underpayments, denials, and unpaid claims occurring?
- Which providers, payers, or service lines are driving the most leakage?
- How is performance trending over time?

The workflow mirrors a typical analytics setup:
**Raw tables → SQL cleaning/modeling → reporting views → Power BI model + measures → dashboards**

## Business Questions
- How much was **claimed vs. paid**, and what is the **payment gap**?
- What % of claims are **Paid in Full / Underpaid / Overpaid / No Payment**?
- What are **days-to-payment** trends and outliers?
- Which **providers** drive the most underpayments or denials?
- What is the **revenue leakage** amount and rate over time?

## Data Model (High Level)
**Core tables**
- `claims` — claim-level facts (claim_date, claim_amount, status, provider_id, patient_id)
- `payments` — payment-level facts (payment_date, payment_amount, claim_id)

**Reporting layer (SQL views)**
- `vw_fact_claims` (or equivalent) — joins claims + payments, adds:
  - `payment_gap` (payment_amount - claim_amount)
  - `payment_status_adjusted` (Paid in Full / Underpaid / Overpaid / No Payment)
  - `days_to_payment_clean` (validated, non-negative days to payment)
- Additional views for rollups such as:
  - monthly trends
  - provider performance
  - denial/underpayment breakdown

## Dashboards (Power BI)
Typical pages included:
1. **Executive Summary**
   - Total Claimed, Total Paid, Leakage $
   - Paid in Full %, Underpaid %, No Payment %
2. **Reimbursement Performance**
   - Claimed vs Paid trend by month
   - Leakage trend and rate
3. **Payment Timeliness**
   - Avg days to payment, distribution, late payment counts
4. **Provider Risk / Drivers**
   - Top providers by underpayment $
   - Denial rates / unpaid counts

## Key Metrics (Definitions)
- **Claimed Amount**: total billed amount submitted on claims
- **Paid Amount**: total reimbursed amount recorded in payments
- **Payment Gap (Leakage $)**: `payment_amount - claim_amount`
- **Leakage Rate**: `SUM(payment_gap) / SUM(claim_amount)` (or use absolute underpayment-only depending on definition)
- **Days to Payment**: `payment_date - claim_date` (cleaned to exclude negative/invalid values)

## How to Use This Repo
- `sql/` — SQL scripts and reporting views used to model the data
- `data/` — sample/raw datasets (or instructions to source data)
- `screenshots/` — dashboard images and model screenshots
- `README.md` — project documentation

## Tools Used
- **PostgreSQL** — data modeling + reporting views
- **Power BI** — data model, measures, dashboards
- **Excel** (optional) — quick validation / spot checks

## Next Improvements
- Add payer dimension + contract rates for expected reimbursement
- Add denial reason codes for root-cause analysis
- Add rolling 30/60/90 day late payment KPI tracking

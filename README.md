# Healthcare Claims & Revenue Leakage Analytics

This project analyzes healthcare insurance claims and payment data to evaluate
reimbursement performance, provider risk, and revenue leakage across the claims lifecycle.

The analysis is built using PostgreSQL for data modeling and Power BI for interactive
dashboards designed for executive, operational, and analytical use cases.

---

## Project Overview

Healthcare organizations rely on timely and accurate reimbursements to maintain
financial health. This project simulates a real-world analytics workflow where
claims, payments, providers, and patients are modeled in SQL and consumed through
Power BI dashboards.

The reporting layer centralizes business logic in SQL views, enabling consistent
metrics for claimed amounts, paid amounts, underpayments, rejection rates, and
payment delays.

---

## Key Questions Explored

- How much revenue is claimed versus actually reimbursed?
- What percentage of claims are underpaid, unpaid, or fully paid?
- Which providers and specialties drive the most underpayment risk?
- How long do payments take, and how is that changing over time?
- Where does revenue leakage occur across the claims process?

---

## Data Model

The project uses a fact/dimension-style model built from SQL views:

- **Fact table**
  - Claims and payments with derived metrics such as payment gap and days to payment

- **Dimension tables**
  - Providers
  - Patients

Business logic and transformations are handled in SQL to keep the BI layer clean
and focused on analysis.

---

## Dashboards

### Executive Overview
High-level financial and operational KPIs including:
- Total claimed vs. paid dollars
- Reimbursement rate
- Claim status distribution
- Payment outcome breakdown

### Provider Performance & Risk
Analysis of provider behavior and operational risk:
- Claimed dollars by provider
- Rejection rates by specialty
- Underpaid claims by provider
- Average days to payment

### Payment Health & Revenue Leakage
Focused on identifying financial leakage:
- Underpaid dollars by provider
- Underpaid dollars as a percentage of total claims
- Payment gap trends over time
- Payment timeliness trends

---

## Tools Used

- PostgreSQL (SQL views, aggregations, data modeling)
- Power BI (data modeling, DAX measures, dashboard design)

---

## Notes

This project uses synthetic healthcare data for educational purposes only.
No real patient or provider information is included.

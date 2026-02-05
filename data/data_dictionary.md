# Data Dictionary – Healthcare Claims Analytics

This document describes the tables, fields, and derived metrics
used in the Healthcare Claims & Revenue Leakage Analytics project.

All data is synthetic and used for educational purposes only.

---

## patients

Contains demographic information for patients associated with claims.

| Column | Description |
|------|------------|
| patient_id | Unique identifier for each patient |
| first_name | Patient first name |
| last_name | Patient last name |
| age | Patient age at time of record |
| gender | Patient gender |
| address | Street address |
| city | City of residence |
| state | State of residence |
| zip_code | Postal code |
| phone | Contact phone number |

---

## providers

Contains information about healthcare providers submitting claims.

| Column | Description |
|------|------------|
| provider_id | Unique identifier for each provider |
| provider_name | Provider organization name |
| specialty | Medical specialty |
| city | Provider city |
| state | Provider state |
| zip_code | Provider postal code |
| phone | Provider contact phone |

---

## claims

Represents insurance claims submitted for reimbursement.

| Column | Description |
|------|------------|
| claim_id | Unique identifier for each claim |
| patient_id | Patient associated with the claim |
| provider_id | Provider submitting the claim |
| claim_date | Date the claim was submitted |
| claim_amount | Amount billed on the claim |
| status | Claim status (Approved, Rejected, Pending) |

---

## payments

Represents payments made against claims.

| Column | Description |
|------|------------|
| payment_id | Unique identifier for each payment |
| claim_id | Associated claim |
| payment_date | Date payment was issued |
| payment_amount | Amount paid |

---

## Derived Fields (SQL Views)

These fields are calculated in SQL views and used for reporting.

| Field | Description |
|------|------------|
| payment_gap | payment_amount - claim_amount |
| payment_status_adjusted | Categorizes claims as Paid in Full, Underpaid, or No Payment |
| days_to_payment | Number of days between claim_date and payment_date |
| days_to_payment_clean | days_to_payment excluding negative or invalid values |
| reimbursement_rate | payment_amount / claim_amount |

---

## Notes on Data Quality

- Negative days to payment may occur in raw data and are excluded
  from timing analysis using a cleaned metric.
- A small tolerance is applied when evaluating full payment to
  account for rounding differences.
- Claims without associated payments are classified as "No Payment."

---

## Reporting Layer

All dashboards consume SQL views rather than raw tables to ensure:
- Consistent business logic
- Reusable metrics
- Clean Power BI data model


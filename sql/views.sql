-- =========================================
-- Reporting Views
-- Healthcare Claims Analytics
-- =========================================

-- Fact view: claims joined to payments
-- Includes derived metrics for payment gap,
-- payment classification, and payment timing.
CREATE OR REPLACE VIEW vw_fact_claims AS
SELECT
    c.claim_id,
    c.claim_date,
    DATE_TRUNC('month', c.claim_date)::date AS claim_month,
    c.patient_id,
    c.provider_id,
    c.status,
    c.claim_amount,

    p.payment_id,
    p.payment_date,
    p.payment_amount,

    (p.payment_amount - c.claim_amount) AS payment_gap,

    -- Adjusted payment classification with tolerance
    CASE
        WHEN p.payment_amount IS NULL THEN 'No Payment'
        WHEN ABS(p.payment_amount - c.claim_amount) <= 5 THEN 'Paid in Full'
        WHEN p.payment_amount < c.claim_amount - 5 THEN 'Underpaid'
        WHEN p.payment_amount > c.claim_amount + 5 THEN 'Overpaid'
        ELSE 'Other'
    END AS payment_status_adjusted,

    -- Cleaned payment timing (negative values excluded)
    CASE
        WHEN p.payment_date IS NULL THEN NULL
        WHEN (p.payment_date::date - c.claim_date::date) < 0 THEN NULL
        ELSE (p.payment_date::date - c.claim_date::date)
    END AS days_to_payment_clean

FROM claims c
LEFT JOIN fact_payments p
    ON p.claim_id = c.claim_id;


-- =========================================
-- Dimension Views
-- =========================================

-- Patient dimension
CREATE OR REPLACE VIEW vw_dim_patient AS
SELECT
    patient_id,
    age,
    gender,
    state
FROM patients;

-- Provider dimension
CREATE OR REPLACE VIEW vw_dim_provider AS
SELECT
    provider_id,
    name AS provider_name,
    specialty,
    state
FROM providers;


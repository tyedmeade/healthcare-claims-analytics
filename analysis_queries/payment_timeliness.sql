SELECT
  DATE_TRUNC('month', claim_date) AS claim_month,
  AVG(days_to_payment_clean) AS avg_days_to_payment
FROM vw_fact_claims
WHERE days_to_payment_clean IS NOT NULL
GROUP BY claim_month
ORDER BY claim_month;

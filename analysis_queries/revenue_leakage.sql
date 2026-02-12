SELECT
  payment_status_adjusted,
  COUNT(*) AS claim_count,
  SUM(claim_amount) AS total_claimed,
  SUM(payment_amount) AS total_paid,
  SUM(payment_gap) AS total_gap
FROM vw_fact_claims
GROUP BY payment_status_adjusted
ORDER BY total_gap DESC;

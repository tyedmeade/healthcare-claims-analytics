SELECT *
FROM vw_fact_claims
WHERE payment_status_adjusted IN ('Underpaid', 'No Payment')
  AND claim_amount > 1000
ORDER BY claim_amount DESC;

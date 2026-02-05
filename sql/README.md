## SQL Views

The reporting layer is built using SQL views to centralize business logic
and keep the Power BI model clean:

- `vw_fact_claims`: claim-level fact view with payments, timing metrics,
  and adjusted payment classifications
- `vw_dim_patient`: patient demographics
- `vw_dim_provider`: provider attributes and specialties

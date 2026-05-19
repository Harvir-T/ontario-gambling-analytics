{{ config(materialized='table') }}

WITH yearly_totals AS (
    SELECT
    EXTRACT(YEAR FROM DATE(year_month || '-01')) AS fiscal_year,
    SUM(cash_wagers_m) AS total_cash_wagers_m,
    SUM(naggr_m) AS total_naggr_m,
    SUM(active_player_accounts_k) AS total_active_player_accounts_k,
    (SUM(naggr_m) * 1000)/SUM(NULLIF(active_player_accounts_k, 0)) AS arppa_cad
    FROM {{ ref('stg_igaming_ontario') }}
    GROUP BY EXTRACT(YEAR FROM DATE(year_month || '-01'))   
)

SELECT
fiscal_year,
total_cash_wagers_m AS current_year_cash_wagers_m,
total_active_player_accounts_k AS current_year_active_player_accounts_k,
arppa_cad AS current_year_average_arppa_cad,
total_naggr_m AS current_year_naggr_m,
LAG(total_naggr_m) OVER (ORDER BY fiscal_year) AS previous_year_naggr_m,
(total_naggr_m / NULLIF(LAG(total_naggr_m) OVER (ORDER BY fiscal_year), 0) - 1) * 100 AS naggr_year_over_year_growth_pct
FROM yearly_totals


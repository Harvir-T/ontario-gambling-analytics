{{ config(materialized='table') }}

SELECT
EXTRACT(YEAR FROM DATE(year_month || '-01')) AS fiscal_year,
SUM(cash_wagers_m) AS total_cash_wagers_m,
SUM(naggr_m) AS total_naggr_m,
AVG(active_player_accounts_k) AS average_active_player_accounts_k,
AVG(arppa_cad) AS average_arppa_cad
FROM {{ ref('stg_igaming_ontario') }}
GROUP BY EXTRACT(YEAR FROM DATE(year_month || '-01'))

{{ config(materialized='table') }}
SELECT 
       fiscal_year,
       quarter,
       SUM(gaming_revenue_m) AS total_gaming_revenue_m,
       SUM(revenue_to_municipality_m) AS total_revenue_to_municipality_m,
       AVG(number_of_patrons_daily_average) AS average_number_of_patrons_daily_average
FROM {{ ref('stg_olg_casinos') }}
GROUP BY fiscal_year, quarter
ORDER BY fiscal_year, quarter

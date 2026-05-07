{{ config(materialized='table') }}

SELECT 
fiscal_year,
quarter,
SUM(gaming_revenue_m) AS total_gaming_revenue_m,
AVG(number_of_patrons_daily_average) AS average_patrons_daily_average,
SUM(number_of_slot_machines) AS total_number_of_slot_machines,
SUM(number_of_table_games) AS total_number_of_table_games,
SUM(number_of_employees) AS total_number_of_employees
FROM {{ ref('stg_olg_casinos') }}
GROUP BY fiscal_year, quarter
ORDER BY fiscal_year, quarter
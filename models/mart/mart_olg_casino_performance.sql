{{ config(materialized='table') }}

SELECT
site,
SUM(gaming_revenue_m) AS total_gaming_revenue_m,
SUM(revenue_to_municipality_m) AS total_revenue_to_municipality_m,
AVG(number_of_patrons_daily_average) AS average_number_of_patrons_daily_average,
AVG(number_of_employees) AS average_number_of_employees
FROM {{ ref('stg_olg_casinos') }}
GROUP BY site
ORDER BY SUM(gaming_revenue_m) DESC
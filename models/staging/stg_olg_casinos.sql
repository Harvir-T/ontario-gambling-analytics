SELECT FiscalYear AS fiscal_year,
        Quarter AS quarter,
        Site AS site,
        GamingRevenue_M AS gaming_revenue_m,
        GamingRevenue_MonthlyAverage_M AS gaming_revenue_monthly_average_m,
        Revenue AS revenue_to_municipality_m,
        NumberOfPatrons_DailyAverage AS number_of_patrons_daily_average,
        NumberOfSlotMachines AS number_of_slot_machines,
        CAST(NULLIF(NumberOfTableGames, '-') AS FLOAT64) AS number_of_table_games,
        NumberOfEmployees AS number_of_employees,
        OLGAnnualPayroll_M AS olg_annual_payroll_m
FROM {{ source('raw', 'olg_casinos') }}
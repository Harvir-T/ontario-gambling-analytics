SELECT
FiscalYearQuarter AS fiscal_year_quarter,
YearMonth AS year_month,
CashWagers_M AS cash_wagers_m,
'CashWagersMoM%' AS cash_wagers_mom,
NAGGR_M AS naggr_m,
'NAGGRMoM%' AS naggr_mom,
ActivePlayerAccounts_K AS active_player_accounts_k,
'ActivePlayerAccountsMoM%' AS active_player_accounts_mom,
ARPPA_CAD AS arppa_cad,
'ARPPA_MoM%' AS arppa_mom
FROM {{ source('raw', 'igaming_ontario') }}
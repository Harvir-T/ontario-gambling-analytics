import pandas as pd
import pandas_gbq

df_olg = pd.read_excel(
    "C:\\Users\\thind\\Downloads\\olg_quarterly_performance_report_summary_data_set_2016-01-29.xlsx",
    header = 2)

df_olg.rename(
    columns= {
        "Gaming Revenue ($M)": "GamingRevenue_M",
        "Gaming Revenue (Monthly Average $M)" : "GamingRevenue_MonthlyAverage_M",
        "Revenue to Municipality ($M)" : "Revenue",
        "Number of Patrons (Daily Average)" : "NumberOfPatrons_DailyAverage",
        "Number of Slot Machines" : "NumberOfSlotMachines",
        "Number of Table Games" : "NumberOfTableGames",
        "Number of Employees" : "NumberOfEmployees",
        "OLG annual payroll ($M)" : "OLGAnnualPayroll_M",
        "Fiscal Year" : "FiscalYear"
    },
    inplace=True
)

df_igaming = pd.read_excel(
    "C:\\Users\\thind\\Downloads\\iGO Monthly Market Performance Data Tables - 2026 February.xlsx", 
    sheet_name="(Data) Monthly Stats",
    header = 2)

df_igaming.rename(
    columns={
        "CashWagers(M)": "CashWagers_M",
        "NAGGR(M)": "NAGGR_M",
        "ActivePlayerAccounts(K)": "ActivePlayerAccounts_K",
        "ARPPA($)": "ARPPA_CAD"
    },
    inplace=True
)

pandas_gbq.to_gbq(
    dataframe=df_olg,
    destination_table="raw.olg_casinos",
    project_id="ontario-gambling-analytics",
    if_exists="replace",  # Options: 'fail', 'replace', 'append'
)

pandas_gbq.to_gbq(
    dataframe=df_igaming,
    destination_table="raw.igaming_ontario",
    project_id="ontario-gambling-analytics",
    if_exists="replace",  # Options: 'fail', 'replace', 'append'
)

print(df_olg.columns.tolist())
print(df_igaming.columns.tolist())
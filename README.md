Welcome to your new dbt project!

### Project Overview
This project analyzes Ontario's Land Gaming market from 1999-2015 and Ontario's Online Gaming market from 2022-2026 using iGaming and OLG data sets. The goal is to understand Ontario's gambling market by tackling these questions:

- The total gambling losses over time
- The growth or decline of land based casinos over time
- The year over year growth or decline of online gambling in Ontario
- The amount Ontarians have lost while online gambling
- Which land casino dominated based on revenue

The analysis was built using Python for data ingestion, dbt for transformation, BigQuery for storage, and Looker Studio for visualization.

### Motivation
Ontario's regulated online gambling market launched in April 2022, making it one of the first provinces in Canada to do so. This project examines the impact of that regulation on Ontario's gambling landscape, covering both the broader market and individual players, including how much the average Ontarian is losing online. To provide full context, the analysis also covers the historical land-based casino market from 1999 to 2015, including which casino sites dominated revenue, offering a foundation for understanding how gambling in Ontario has evolved.

### Data Sources

# OLG Quarterly Performance Report 1999 - 2015
- https://data.ontario.ca/dataset/ontario-lottery-and-gaming-corporation-performance
- This data set comes from the official data.ontario.ca site.
- This contains Gaming Revenue, Gaming Revenue Monthly Average, Revenue to Municipality, Number of Patrons, Number of Slot Machines, Number of Table Games, Number of Employees, and OLG payroll.
- This is organized by Casino Site per Quarter in each Fiscal Year.


# iGaming Ontario's Market Performance Report 2022 - 2026
- https://www.igamingontario.ca/en/operator/market-performance-report-monthly
- This data set comes from the official iGaming Ontario site.
- This contains Cash Wagers, Net Aggregate Gaming Revenue (NAGGR), Active Player Accounts, Average Revenue Per Player Account. Each of these statistics also has a Month over Month percentage (MoM %).
- This is organized Monthly by each Fiscal Year.


### Data Pipeline
Steps taken to process the market data:

- Raw data was ingested from Excel files into BigQuery using Python (pandas + pandas_gbq)
- Staging models were built in dbt as views to clean and standardize the data, renaming columns from PascalCase to snake_case, fixing broken MoM% column references, and passing through source values without aggregation
- Mart models were built in dbt using SQL to aggregate the staging data and answer each business question, including yearly rollups, YoY growth rates, ARPPA calculations, and site-level revenue breakdowns
- The final data was visualized using Looker Studio, connected directly to BigQuery


### Key Findings
BQ1: Between 1999 and 2015, Ontario's land-based casinos generated $49.5 billion CAD in total gaming revenue, averaging approximately $3.09 billion annually. In contrast, Ontario's regulated online gambling market generated $10.9 billion CAD between April 2022 and February 2026, roughly 3.5 years, averaging approximately $3.12 billion annually. This means the online market effectively matched the annual revenue of the land-based casino industry within its first few years of operation, a remarkable pace of growth for a newly regulated market.

<img width="728" height="650" alt="image" src="https://github.com/user-attachments/assets/6b53fcb4-a77c-49e0-8baa-62f358112b78" />
BQ2: Between 1999 and 2015 we see that Ontario's land-based casinos experienced 


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

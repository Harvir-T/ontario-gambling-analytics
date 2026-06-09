Welcome to your new dbt project!

## Project Overview
This project analyzes Ontario's Land Gaming market from 1999-2015 and Ontario's Online Gaming market from 2022-2026 using iGaming and OLG data sets. The goal is to understand Ontario's gambling market by tackling these questions:

- The total gambling losses over time
- The growth or decline of land based casinos over time
- The year over year growth or decline of online gambling in Ontario
- The amount Ontarians have lost while online gambling
- Which land casino dominated based on revenue

The analysis was built using Python for data ingestion, dbt for transformation, BigQuery for storage, and Looker Studio for visualization.

## Motivation
Ontario's regulated online gambling market launched in April 2022, making it one of the first provinces in Canada to do so. This project examines the impact of that regulation on Ontario's gambling landscape, covering both the broader market and individual players, including how much the average Ontarian is losing online. To provide full context, the analysis also covers the historical land-based casino market from 1999 to 2015, including which casino sites dominated revenue, offering a foundation for understanding how gambling in Ontario has evolved.

## Data Sources

### OLG Quarterly Performance Report 1999 - 2015
- https://data.ontario.ca/dataset/ontario-lottery-and-gaming-corporation-performance
- This data set comes from the official data.ontario.ca site.
- This contains Gaming Revenue, Gaming Revenue Monthly Average, Revenue to Municipality, Number of Patrons, Number of Slot Machines, Number of Table Games, Number of Employees, and OLG payroll.
- This is organized by Casino Site per Quarter in each Fiscal Year.


### iGaming Ontario's Market Performance Report 2022 - 2026
- https://www.igamingontario.ca/en/operator/market-performance-report-monthly
- This data set comes from the official iGaming Ontario site.
- This contains Cash Wagers, Net Aggregate Gaming Revenue (NAGGR), Active Player Accounts, Average Revenue Per Player Account. Each of these statistics also has a Month over Month percentage (MoM %).
- This is organized Monthly by each Fiscal Year.


## Data Pipeline
Steps taken to process the market data:

- Raw data was ingested from Excel files into BigQuery using Python (pandas + pandas_gbq)
- Staging models were built in dbt as views to clean and standardize the data, renaming columns from PascalCase to snake_case, fixing broken MoM% column references, and passing through source values without aggregation
- Mart models were built in dbt using SQL to aggregate the staging data and answer each business question, including yearly rollups, YoY growth rates, ARPPA calculations, and site-level revenue breakdowns
- The final data was visualized using Looker Studio, connected directly to BigQuery


## Key Findings
BQ1: Between 1999 and 2015, Ontario's land-based casinos generated $49.5 billion CAD in total gaming revenue, averaging approximately $3.09 billion annually. In contrast, Ontario's regulated online gambling market generated $10.9 billion CAD between April 2022 and February 2026, roughly 3.5 years, averaging approximately $3.12 billion annually. This means the online market effectively matched the annual revenue of the land-based casino industry within its first few years of operation, a remarkable pace of growth for a newly regulated market.

BQ2: Between 1999 and 2015 we see that Ontario's land-based casinos experienced a rise until 2005/2006 followed by a steady decline until 2015. The decline can be shown in the charts below. 

<img width="728" height="650" alt="revenue-image" src="https://github.com/user-attachments/assets/6b53fcb4-a77c-49e0-8baa-62f358112b78" />

<img width="527" height="396" alt="patrons-image" src="https://github.com/user-attachments/assets/945bb882-872d-4bc1-994e-5ca4e189a422" /> 

These charts show the revenue from land based casinos rise to a peak of $3.657 billion CAD in the 2005/2006 Fiscal Year followed by an average drop of $57 million CAD in revenue per year. We can also see that the patrons fluctuated for the first few years then reached a peak of 127,933 daily average patrons in the 2004/2005 Fiscal Year followed by a steady decline in the following years.

<img width="897" height="406" alt="employee-image" src="https://github.com/user-attachments/assets/4a937f0a-4735-420e-a611-5b04e4898d35" />

<img width="500" height="387" alt="slots-image" src="https://github.com/user-attachments/assets/224e9952-2235-47ce-9c84-cfaa89807344" />

The decline is also seen in the infrastructure of Ontario's land based casinos through the number of employees and the amount of slot machines. We see the peak of employees and the curve of the amount of slot machines flatten in the 2004/2005 Fiscal Year. This period coincided with the rise of home entertainment and early online alternatives which may have contributed to the decline of the land casino numbers. The decline being in 2004 also shows that Ontario's land-based casino market was already experiencing a decline approximately 17 years before regulated online gambling launched in Ontario in April 2022.

BQ3: After Ontario's online gambling market was regulated in April 2022 we witnessed Year over Year growth rates for the 2023 - 2025 years. These growth rates are shown in the chart below.

<img width="739" height="342" alt="yoy-image" src="https://github.com/user-attachments/assets/7965b44a-f986-4ec9-a8ad-7ac0934b6d16" />

We are only able to show the growth rates from 2023 - 2025 because 2022 is the baseline year and 2026 is only partial data as the dataset only has data until February 2026. We see explosive growth from 2022 to 2023 as the Gaming Revenue grew 155.27% in the first year of regulated online gambling. In the following 2 years we see a growth of 32.49% and 34.32% respectively.

<img width="1445" height="393" alt="players-image" src="https://github.com/user-attachments/assets/f0d71cf9-95b0-4f65-b04a-7aa9d0417964" />

This chart shows the steady growth of active player accounts in Ontario's online gambling market. There is a dropoff in 2026 which is also due to this year only containing partial data for the year. This growth showcases that online gambling is only becoming more popular as the years go on.

This insight shows that while Ontario's online market has decelerated significantly from the initial surge, steady 32-34% growth rates imply a rapidly maturing market that is capturing more Ontarians year after year. 

BQ4: 







## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

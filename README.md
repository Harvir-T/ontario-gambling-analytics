# Ontario Gambling Analytics: Land-Based and Online Casino Market Analysis (1999-2015 & 2022-2026)
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

## Dashboard
https://datastudio.google.com/s/kVGogLF6xy4

## Key Findings
### Total Gaming Revenue: Land-Based vs. Online 
Between 1999 and 2015, Ontario's land-based casinos generated $49.5 billion CAD in total gaming revenue, averaging approximately $3.09 billion annually. In contrast, Ontario's regulated online gambling market generated $10.9 billion CAD between April 2022 and February 2026, roughly 3.5 years, averaging approximately $3.12 billion annually. This means the online market effectively matched the annual revenue of the land-based casino industry within its first few years of operation, a remarkable pace of growth for a newly regulated market.

<img width="690" height="683" alt="image" src="https://github.com/user-attachments/assets/277cb07a-c9e0-4b2c-b9d8-26060d2fa24d" />

<img width="712" height="682" alt="image" src="https://github.com/user-attachments/assets/20e1a64b-fee2-4df0-8ebf-c994a18ab1b2" />

### Ontario Land Casino Trends (1999-2015) 
Between 1999 and 2015 we see that Ontario's land-based casinos experienced a rise until 2005/2006 followed by a steady decline until 2015. The decline can be shown in the charts below. 

<img width="728" height="650" alt="revenue-image" src="https://github.com/user-attachments/assets/6b53fcb4-a77c-49e0-8baa-62f358112b78" />

<img width="527" height="396" alt="patrons-image" src="https://github.com/user-attachments/assets/945bb882-872d-4bc1-994e-5ca4e189a422" /> 

These charts show the revenue from land based casinos rise to a peak of $3.657 billion CAD in the 2005/2006 Fiscal Year followed by an average drop of $57 million CAD in revenue per year. We can also see that the patrons fluctuated for the first few years then reached a peak of 127,933 daily average patrons in the 2004/2005 Fiscal Year followed by a steady decline in the following years.

<img width="897" height="406" alt="employee-image" src="https://github.com/user-attachments/assets/4a937f0a-4735-420e-a611-5b04e4898d35" />

<img width="500" height="387" alt="slots-image" src="https://github.com/user-attachments/assets/224e9952-2235-47ce-9c84-cfaa89807344" />

The decline is also seen in the infrastructure of Ontario's land based casinos through the number of employees and the amount of slot machines. We see the peak of employees and the curve of the amount of slot machines flatten in the 2004/2005 Fiscal Year. This period coincided with the rise of home entertainment and early online alternatives which may have contributed to the decline of the land casino numbers. The decline being in 2004 also shows that Ontario's land-based casino market was already experiencing a decline approximately 17 years before regulated online gambling launched in Ontario in April 2022.

### iGaming Ontario Year over Year Growth
After Ontario's online gambling market was regulated in April 2022 we witnessed Year over Year growth rates for the 2023 - 2025 years. These growth rates are shown in the chart below.

<img width="739" height="342" alt="yoy-image" src="https://github.com/user-attachments/assets/7965b44a-f986-4ec9-a8ad-7ac0934b6d16" />

We are only able to show the growth rates from 2023 - 2025 because 2022 is the baseline year and 2026 is only partial data as the dataset only has data until February 2026. We see explosive growth from 2022 to 2023 as the Gaming Revenue grew 155.27% in the first year of regulated online gambling. In the following 2 years we see a growth of 32.49% and 34.32% respectively. This insight shows that while Ontario's online market has decelerated significantly from the initial surge, steady 32-34% growth rates imply a rapidly maturing market that is capturing more Ontarians year after year. 

<img width="1445" height="393" alt="players-image" src="https://github.com/user-attachments/assets/f0d71cf9-95b0-4f65-b04a-7aa9d0417964" />

This chart shows the steady growth of active player accounts in Ontario's online gambling market. There is a dropoff in 2026 which is also due to this year only containing partial data for the year. This growth showcases that online gambling is only becoming more popular as the years go on.

### Average Player Loss (ARPPA) 
To understand how much the average Ontarian is losing through online gambling, we can look at the Average Revenue Per Player Account (ARPPA), which represents the net annual loss per active player. Across all years from 2022 to 2025, the weighted average ARPPA is $285.46 CAD. Breaking this down year by year, and excluding 2026 as partial data, we see a consistent upward trend: $239.66 in 2022, $283.39 in 2023, $283.85 in 2024, and $299.74 in 2025, as shown in the chart below.

<img width="635" height="347" alt="image" src="https://github.com/user-attachments/assets/4db012c7-96c6-4908-86aa-a93294cb14fb" />

This trend shows that not only are more Ontarians gambling online each year, but the average player is also losing more annually, suggesting that online gambling is having an increasing financial impact on individual players over time.

### Top Performing Land Casino Sites 
Between 1999 and 2015, Ontario's land-based casino revenue was heavily concentrated among a small number of major sites, as shown in the chart below.

<img width="906" height="470" alt="image" src="https://github.com/user-attachments/assets/746abacf-d071-43f3-bc79-f9f24f4a47be" />

Woodbine Raceway dominated Ontario's land-based casino market, generating $8.381 billion CAD in total gaming revenue, making it the highest earning site by a significant margin. Niagara Casinos came in second with $6.744 billion CAD, followed closely by Casino Rama at $6.512 billion CAD. Casino Windsor ranked fourth at $5.005 billion CAD. The remaining sites generated considerably less, with no other site exceeding $2.500 billion CAD. This concentration of revenue among the top four sites suggests that Ontario's land-based gambling market was heavily centralized around a small number of major venues.

## Caveats
There are several important data limitations to be aware of when interpreting the findings of this project.

First, there is a gap in the data between 2015 and 2022. The OLG dataset ends in 2015 and the iGaming Ontario dataset begins in April 2022, leaving a seven year period with no data from either source. No conclusions can be drawn about Ontario's gambling market during this period.

Second, the two datasets operate at different levels of granularity. The OLG data is organized quarterly by casino site, while the iGaming Ontario data is organized monthly at the province-wide level. This means direct comparisons between the two datasets should be interpreted with caution.

Third, the per-player metrics between the two datasets are not directly comparable. ARPPA from the iGaming dataset measures the net annual loss per active online player, while the OLG dataset tracks patron counts at the site level. These metrics measure different things and cannot be used to draw conclusions about how individual player behavior has changed across the two eras.

## Recommendations
Based on the findings of this project, the following recommendations are directed at Ontario policymakers and regulators.

First, the consistent year over year increase in ARPPA, rising from $239.66 in 2022 to $299.74 in 2025, suggests that the average Ontarian is losing more money online each year. Policymakers should closely monitor this trend and consider strengthening responsible gambling measures as the online market continues to mature, particularly around player loss limits and early intervention tools.

Second, Ontario's online gambling market has grown rapidly, averaging over $3 billion CAD annually within its first few years of regulation. With growth stabilizing in the 32-34% range, the market is maturing quickly and regulatory frameworks should scale accordingly to ensure consumer protections keep pace with market expansion.

Third, the structural decline of Ontario's land-based casino market began in 2004/2005, approximately 17 years before regulated online gambling launched in Ontario. Policymakers should be cautious about attributing land-based casino struggles to online competition, as the data does not support that conclusion. Decisions about land-based venue support or consolidation should account for the long-standing nature of this decline.

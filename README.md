# Sanken Sales Performance Analysis

## Project Background
Sanken, an Indonesian company established in 1996, specializes in selling a variety of electrical appliances. I'm partnering with the Data Scientist to extract insights and deliver recommendations to improve performance across sales, product and marketing teams.

Insights and recommendations are provided on the following key areas:
- Sales Trends Analysis: Evaluation of historical sales patterns, focusing on revenue, order volume, and average order value (AOV).
- Product Level Performance: An analysis of Sanken's various product lines, understanding their impact on sales and returns.
- Customer Engagement: Study of customer choices, product preferences, and post-purchase behavior to determine factors influencing loyalty and satisfaction.
  
See the interactive sales dashboard and visualizations I've made in [Sales Dashboard Tableau Public](https://public.tableau.com/app/profile/hans.aristo/viz/SankenSalesandCustomerDashboard/SalesDashboard)

See the interactive customer engagement dashboard and visualizations I've made in [Customer Dashboard Tableau Public](https://public.tableau.com/app/profile/hans.aristo/viz/SankenSalesandCustomerDashboard/CustomerDashboard)

See the queries I used to clean, explore and filter data in [SQL File](https://github.com/pumpbumpdump/Sanken-Sales-Performance-Analysis/blob/main/query.sql)

See the data I analyzed in [Excel File](https://github.com/pumpbumpdump/Sanken-Sales-Performance-Analysis/blob/main/Data/data.xlsx)

## Executive Summary
Sanken's sales analysis of 17k records across 2016-2020 shows an average around Rp. 18 billion each year, with the province of Jakarta and Banten contributing 71% of sales. Refrigerator and Washing Machine account for 72% of sales. Sanken can benefit from expanding top product lines and optimizing bundling to increase customer lifetime value. Targeted growth in DKI Jakarta and Banten province, will reinforce Sanken's market position and drive sustainable growth.

![ERD drawio (3)](https://github.com/user-attachments/assets/a797a25f-b0b8-4a24-8b68-528c5c3ed871)

<p align="center"><strong>Sanken Database ERD</strong></p>

## Insights Deep-Dive
### Sales Trends and Growth Rates
- Sanken averages Rp. 18 billion in annual sales and 3400 orders per year.
- Sales surged in 2017 by an astounding 142% and stabilized in the subsequent years, with minor fluctuations.
- DKI Jakarta and Banten provinces together account for a substantial 71% of total sales, with contributions of 39% and 32%, respectively. In contrast, sales from Jawa Barat province show a significant decline, contributing only 19% of total sales. The performance in Sumatra Utara is even more subdued, The performance in Sumatra Utara and other regions is even more subdued, accounting for less than 3% of total sales.
- Seasonality is observed in April, with sales showing a surge across different years.

![DA](https://github.com/user-attachments/assets/91d9cbae-363e-413a-8fad-1ea9184394d1)


### Key Product Performance
- Refrigerator, Washing Machine, and Water Dispenser items generate 82% of total revenue.
- Refrigerator products consistently lead in orders count by 35% and revenue by 42% from 2016 to 2020.
- Refrigerator and Washing Machine categories experienced remarkable growth with increases of 173% and 214% respectively in 2017.
- The Rice Cooker’s order count of 11% is nearly double of its revenue share of 6%, likely due to its low price or frequent inclusion in bundles or promotions, resulting in high sales volume but lower revenue contribution.

![treemap](https://github.com/user-attachments/assets/8b28f265-91c8-41db-bbd7-b497121ece72)
<p align="center"><strong>Product Performance Treemap</strong></p>


### Customer Growth and Repeat Purchase Trends
- Unique customers increased significantly by 248% in 2017.
- The repeat rate (≥2 orders) decreases due to the introduction of 248% increase of unique customers in 2017 compared to 2016. Furthermore, repeat rate gradually decreases from 86% in 2017 to 78% in 2018, indicating challenges in retaining customers after their initial purchases, increases again to 90% in 2019, suggesting that retention efforts were improved or more customers made repeat purchases during that period.

<p align="center">
  <img src="https://github.com/user-attachments/assets/aac42604-2285-4570-aa07-71b7dfe7cc0e" alt="Repeat Rate">
</p>


## Recommendations
- Expand the product range of refrigerators, washing machine, and water dispenser by introducing premium models to cater to a wider range of customer preferences, boosting repeat purchases, and strengthening market positioning.
- Expand acquisition channels to include influencer partnerships, social media, and affiliate programs. Refine Sanken's messaging to attract new customers and re-engage past ones.
- Maintain resource allocation to Jakarta and Banten province, implementing region-specific marketing and product availability strategies that align with local preferences.
- Leverage localized partnerships and culturally tailored promotions to harness growth opportunities in Jakarta and Banten province, ensuring the stabilization of sales in these emerging markets.

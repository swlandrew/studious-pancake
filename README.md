# Retail Analytics & Category Intelligence Audit
### Solving Business Problems with Advanced SQL

## Project Background
In this project, I transformed raw transactional data from the Sakila rental database into a full Business Intelligence suite. Drawing on my experience as a Data Analyst, I designed these queries to go beyond simple data extraction. I built this suite to monitor inventory health, track customer lifetime value (LTV), and visualize seasonal revenue trends to drive data-driven decision-making.

## What I Built

### 1. Performance Tracking
**SQL File:** `Revenue_and_Growth_Analysis.sql`
I developed a Strategic Performance Dashboard using Advanced Window Functions to provide leadership with high-level growth metrics:
* **Month-over-Month (MoM) Trends:** Utilized `LAG()` to pull previous month totals into current rows, enabling instant growth percentage analysis without fragmented reporting.
* **The Competitive Gap:** Combined `RANK()` and `LAG()` to visualize the revenue "distance" between categories, identifying market leaders versus rising competitors.
* **Cumulative Revenue:** Built running totals using `SUM(...) OVER(...)` to help teams track mid-month performance against monthly targets.

### 2. Category & Product Strategy
**SQL File:** `Inventory_and_Category_Intelligence.sql`
I approached the film catalog as a retail inventory specialist, focusing on pricing and product mix optimization:
* **Internal Benchmarking:** Employed correlated subqueries to identify products priced higher or lower than their specific category average.
* **Smart Tiering:** Applied `CASE` logic to automatically bucket 1,000+ titles into 'Budget', 'Regular', and 'Premium' tiers based on rental rates.
* **Niche Discovery:** Developed search scripts using string manipulation (`CONCAT`, `LIKE`) to help marketing teams isolate specific sub-genres for targeted promotions.

### 3. Inventory & Operations
**SQL File:** `Operational_and_Data_Cleaning.sql`
To ensure data integrity and operational efficiency, I built automated audits similar to the reporting suites I developed in previous roles:
* **Dead Stock Alerts:** Used `LEFT JOINs` and `HAVING` clauses to identify "orphaned" titles—items in the catalog with zero physical inventory—directly addressing lost revenue opportunities.
* **Store Audits:** Analyzed revenue and film density across different store locations to evaluate operational efficiency.
* **Data Standardization:** Automated the cleaning of SKUs and mailing lists using `CONCAT`, `LEFT`, and `UPPER` for seamless CRM integration.

### 4. Understanding the Customer
**SQL File:** `Customer_Segmentation_and_Behaviour.sql`
* **High-Value Segmentation:** Isolated top-tier spenders and mapped them to geographic locations to identify key demographics.
* **Retention Metrics:** Used `MIN()` and `MAX()` rental dates to calculate the "active span" of customers and monitor churn.
* **Behavioral Filtering:** Applied `EXISTS` logic to build hyper-targeted email lists based on specific genre preferences.

## Conclusion & Strategic Recommendations

Based on this audit, I have outlined the following recommendations to drive category growth:

* **Restock High-Velocity "Orphaned" Titles:** The inventory audit revealed top-tier titles with zero physical stock. Restocking these is a low-effort, high-impact move for immediate revenue capture.
* **Tiered Marketing for "Action" Segments:** Using behavioral filters, we can deploy targeted email campaigns for customers with a proven affinity for high-performance genres like Action, increasing retention.
* **Shift to Data-Driven Scheduling:** Store hours should be optimized based on the "Rentals by Day" metrics to ensure staffing levels match peak consumer demand.

---
*Note: This project utilizes the Sakila sample database to demonstrate advanced SQL proficiency.*

# E-Commerce Data Warehouse Project

## Project Overview
This project builds an end-to-end E-Commerce Data Warehouse using MySQL. It transforms raw transaction data into structured tables for business analysis and reporting.

## Tools Used
- MySQL
- MySQL Workbench
- SQL

## Project Workflow
1. **Staging (STG):** Load raw e-commerce transaction data.
2. **Operational Data Store (ODS):** Copy data into the ODS layer.
3. **Data Warehouse (DWH):** Prepare business data and create fact and dimension tables.
4. **Star Schema:** Organize sales data for analytical queries.
5. **Sales Mart:** Combine sales facts with product, customer, date, and country details.
6. **Business Analysis:** Run SQL queries to answer business questions.

## Data Model
**Fact table**
- `fact_sales`

**Dimension tables**
- `dim_product`
- `dim_customer`
- `dim_date`
- `dim_country`

**Sales mart**
- `ecommerce_sales_mart`

## Business Analysis
The project includes SQL queries for:
- Country-wise total sales
- Top 10 products by quantity sold
- Monthly sales trends
- Top 10 customers by sales
- Average sales analysis

## SQL Files
- `01_staging.sql`
- `02_ods.sql`
- `03_data_warehouse.sql`
- `04_sales_mart.sql`
- `05_business_analysis.sql`

## Key Learning
- SQL data loading and validation
- Data transformation
- Fact and dimension modelling
- Star schema concepts
- Analytical SQL queries

## Note
## Dataset
The project uses a sample e-commerce transaction dataset for educational and portfolio purposes. The original download source is currently unverified. Dataset redistribution permissions will be checked before public sharing.
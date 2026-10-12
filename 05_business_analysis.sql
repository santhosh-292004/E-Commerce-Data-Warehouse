# Country_wise_total_sales
select
    country,
    sum(sales_amount) as total_sales
from ecommerce_sales_mart
group by country
order by total_sales desc;

# Top_10_products
select
    stockcode,
    description,
    sum(quantity) as total_quantity_sold
from ecommerce_sales_mart
group by stockcode, description
order by total_quantity_sold desc
limit 10;

# Monthly_sales_trend
select
    invoice_year,
    invoice_month,
    month_name,
    sum(sales_amount) as total_sales
from ecommerce_sales_mart
group by
    invoice_year,
    invoice_month,
    month_name
order by
    invoice_year,
    invoice_month;

# Top_10_customers    
select
    customerid,
    sum(sales_amount) as total_sales
from ecommerce_sales_mart
group by customerid
order by total_sales desc
limit 10;

# Average_sales
select
    avg(sales_amount) as average_order_value
from ecommerce_sales_mart;

# Actual_average_order_value
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        invoiceno,
        SUM(sales_amount) AS order_total
    FROM ecommerce_sales_mart
    GROUP BY invoiceno
) AS orders;
create table ecommerce_sales_mart as
select
    f.invoiceno,
    p.stockcode,
    p.description,
    c.customerid,
    d.invoice_date,
    d.invoice_year,
    d.invoice_month,
    d.month_name,
    co.country,
    f.quantity,
    f.unitprice,
    f.sales_amount
from fact_sales f
join dim_product p
    on f.stockcode = p.stockcode
join dim_customer c
    on f.customerid = c.customerid
join dim_date d
    on f.invoice_date = d.invoice_date
join dim_country co
    on f.country = co.country;
    
select * from ecommerce_sales_mart limit 10;

select count(*) as total_rows from ecommerce_sales_mart;


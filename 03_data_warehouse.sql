create table dwh_ecommerce as select * from ods_ecommerce where 1 = 0;

insert into dwh_ecommerce select * from ods_ecommerce;

select count(*) as total_rows from dwh_ecommerce;

select * from dwh_ecommerce limit 10;

create table dwh_ecommerce_business as
select
    invoiceno,
    stockcode,
    description,
    quantity,
    invoicedate,
    unitprice,
    customerid,
    country,
    quantity * unitprice as sales_amount
from dwh_ecommerce;

select * from dwh_ecommerce_business limit 10;

alter table dwh_ecommerce_business add column sales_category varchar(20);

update dwh_ecommerce_business
set sales_category =
    case
        when sales_amount >= 100 then 'high'
        when sales_amount >= 50 then 'medium'
        else 'low'
    end;
    
select
    invoiceno,
    stockcode,
    sales_amount,
    sales_category
from dwh_ecommerce_business
limit 10;

create table dim_product as
select distinct
    stockcode,
    description
from dwh_ecommerce_business;

select * from dim_product limit 10;

create table dim_customer as
select distinct
    customerid
from dwh_ecommerce_business
where customerid is not null;

select * from dim_customer limit 10;

create table dim_date as
select distinct
    date(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as invoice_date,
    year(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as invoice_year,
    month(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as invoice_month,
    monthname(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as month_name,
    day(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as invoice_day
from dwh_ecommerce_business;

select * from dim_date limit 10;

create table dim_country as
select distinct
    country
from dwh_ecommerce_business;

select * from dim_country;

create table fact_sales as
select
    invoiceno,
    stockcode,
    customerid,
    country,
    date(str_to_date(invoicedate, '%m/%d/%Y %H:%i')) as invoice_date,
    quantity,
    unitprice,
    sales_amount
from dwh_ecommerce_business;

select * from fact_sales limit 10;

select count(*) as total_rows from fact_sales;

select
    f.invoiceno,
    f.stockcode,
    p.description,
    f.quantity,
    f.unitprice,
    f.sales_amount
from fact_sales f
join dim_product p
    on f.stockcode = p.stockcode
limit 10;

select
    f.invoiceno,
    p.description,
    c.customerid,
    d.invoice_date,
    d.invoice_year,
    d.invoice_month,
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
    on f.country = co.country
limit 10;
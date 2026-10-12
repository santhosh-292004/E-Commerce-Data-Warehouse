create table stg_ecommerce (
    invoiceno varchar(20),
    stockcode varchar(20),
    description text,
    quantity int,
    invoicedate varchar(30),
    unitprice decimal(10,2),
    customerid varchar(20),
    country varchar(100)
);

set global local_infile = 1;

show global variables like 'local_infile';


load data local infile ':C:/path/to/ecommerce_data.csv'
into table stg_ecommerce
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(@idx, invoiceno, stockcode, description, quantity, invoicedate, unitprice, customerid, country);

select * from stg_ecommerce limit 10;

select
    count(*) as total_rows,
    sum(invoiceno is null) as null_invoiceno,
    sum(stockcode is null) as null_stockcode,
    sum(description is null) as null_description,
    sum(quantity is null) as null_quantity,
    sum(invoicedate is null) as null_invoicedate,
    sum(unitprice is null) as null_unitprice,
    sum(customerid is null) as null_customerid,
    sum(country is null) as null_country
from stg_ecommerce;

select
    invoiceno,
    stockcode,
    customerid,
    count(*) as duplicate_count
from stg_ecommerce
group by invoiceno, stockcode, customerid
having count(*) > 1;

select * from stg_ecommerce where quantity <= 0 or unitprice <= 0;
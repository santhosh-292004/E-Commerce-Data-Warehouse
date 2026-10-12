create table ods_ecommerce as select * from stg_ecommerce where 1 = 0;

insert into ods_ecommerce select * from stg_ecommerce;

select count(*) as total_rows from ods_ecommerce;

select * from ods_ecommerce limit 10;
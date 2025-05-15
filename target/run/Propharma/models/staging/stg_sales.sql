
  create view "propharma"."public"."stg_sales__dbt_tmp"
    
    
  as (
    


with raw_sales as (
    select * from "propharma"."public"."sales"
)
select
    sale_id,
    prescription_id,
    medicine_id,
    sale_date::date as sale_date,
    quantity_sold::int,
    amount::numeric(10,2)
from raw_sales
  );
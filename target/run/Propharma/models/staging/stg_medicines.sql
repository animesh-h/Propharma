
  create view "propharma"."public"."stg_medicines__dbt_tmp"
    
    
  as (
    

with raw_medicines as (
    select * from "propharma"."public"."medicines"
)

select
    medicine_id,
    name,
    category,
    price::numeric(10,2) as price,
    expiry_date::date as expiry_date
from raw_medicines
  );
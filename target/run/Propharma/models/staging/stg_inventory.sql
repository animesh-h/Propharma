
  
    

  create  table "propharma"."public"."stg_inventory__dbt_tmp"
  
  
    as
  
  (
    with raw_inventory as (
    select * from public.inventory
)

select
    medicine_id,
    stock_qty::int as stock_qty,
    last_updated::date as last_updated
from raw_inventory
  );
  
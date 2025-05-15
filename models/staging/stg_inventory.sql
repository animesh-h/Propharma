{{ config(
    materialized='view'
) }}

with raw_inventory as (
    select * from {{ source('raw_tables','inv')}}
)

select
    medicine_id,
    stock_qty::int as stock_qty,
    last_updated::date as last_updated
from raw_inventory
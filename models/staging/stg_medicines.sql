{{ config(
    materialized='view'
) }}

with raw_medicines as (
    select * from {{ source('raw_tables','med')}}
)

select
    medicine_id,
    name,
    category,
    price::numeric(10,2) as price,
    expiry_date::date as expiry_date
from raw_medicines
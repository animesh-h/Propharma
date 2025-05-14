{{ config(
    materialized='incremental',
    unique_key='medicine_id'
) }}

with raw_medicines as (
    select * from public.medicines
)

select
    medicine_id,
    name,
    category,
    price::numeric(10,2) as price,
    expiry_date::date as expiry_date
from raw_medicines
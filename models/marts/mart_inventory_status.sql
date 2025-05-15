{{ config(
    materialized='incremental',
    unique_key='medicine_id'
) }}

select
    m.medicine_id,
    m.name,
    m.category,
    m.price,
    m.expiry_date,
    i.stock_qty,
    i.last_updated,
    case 
        when i.stock_qty < 20 then true
        else false
    end as low_stock_flag
from {{ ref('stg_inventory') }} i
join {{ ref('stg_medicines') }} m on i.medicine_id = m.medicine_id
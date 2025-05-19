with spine as (
  select min(date_day) as start_date, max(date_day) as end_date
  from {{ ref('date_spine') }}
)

select i.stock_qty
,m.name
,m.expiry_date
,-(m.price*i.stock_qty ) as "loss"
from {{ ref('stg_medicines') }} m
join {{ ref('stg_inventory') }} i on m.medicine_id = i.medicine_id
join spine on 1=1
where m.expiry_date between spine.start_date and spine.end_date
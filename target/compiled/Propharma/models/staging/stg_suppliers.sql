with raw_suppliers as (
    select * from public.suppliers
)

select
    supplier_id,
    supplier_name,
    medicine_id,
    last_supplied_date::date as last_supplied_date
from raw_suppliers
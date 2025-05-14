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
    end as low_stock_flag,
    {% if is_expired('m.expiry_date') %}
        true as expired
    {% else %}
        false as expired
    {% endif %}
from {{ ref('stg_inventory') }} i
join {{ ref('stg_medicines') }} m on i.medicine_id = m.medicine_id
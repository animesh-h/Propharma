
      
  
    

  create  table "propharma"."public"."mart_inventory_status"
  
  
    as
  
  (
    

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
from "propharma"."public"."stg_inventory" i
join "propharma"."public"."stg_medicines" m on i.medicine_id = m.medicine_id
  );
  
  
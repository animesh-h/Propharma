
      
  
    

  create  table "propharma"."public"."mart_sales_summary"
  
  
    as
  
  (
    

select
    date_trunc('day', sale_date) as sales_day,
    date_trunc('month', sale_date) as sales_month,
    count(*) as total_sales_count,
    sum(quantity_sold)::int as total_quantity,
    sum(amount)::numeric(10,2) as total_revenue
from "propharma"."public"."stg_sales"
group by sales_day, sales_month
order by sales_day
  );
  
  
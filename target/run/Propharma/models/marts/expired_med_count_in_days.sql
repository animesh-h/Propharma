
  create view "propharma"."public"."expired_med_count_in_days__dbt_tmp"
    
    
  as (
    with  __dbt__cte__date_spine as (








with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
    
    

    )

    select *
    from unioned
    where generated_number <= 10
    order by generated_number



),

all_periods as (

    select (
        

    cast('2025-05-15' as date) + ((interval '1 day') * (row_number() over (order by 1) - 1))


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= cast('2025-05-25' as date)

)

select * from filtered


), spine as (
  select min(date_day) as start_date, max(date_day) as end_date
  from __dbt__cte__date_spine
)

select i.stock_qty
,m.name
,m.expiry_date
,-(m.price*i.stock_qty ) as "loss"
from "propharma"."public"."stg_medicines" m
join "propharma"."public"."stg_inventory" i on m.medicine_id = i.medicine_id
join spine on 1=1
where m.expiry_date between spine.start_date and spine.end_date
  );
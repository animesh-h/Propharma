with  __dbt__cte__date_spine as (








with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
    
    

    )

    select *
    from unioned
    where generated_number <= 4
    order by generated_number



),

all_periods as (

    select (
        

    cast('2000-01-01' as date) + ((interval '1 day') * (row_number() over (order by 1) - 1))


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= cast('2000-01-05' as date)

)

select * from filtered


), spine as (
  select min(date_day) as start_date, max(date_day) as end_date
  from __dbt__cte__date_spine
)

select count(m.quantity)
,m.name
,m.expiry_date
from "propharma"."public"."stg_medicines" m
where m.expiry_date between start_date and end_date
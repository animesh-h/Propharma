select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sales_id
from "propharma"."public"."sales"
where sales_id is null



      
    ) dbt_internal_test
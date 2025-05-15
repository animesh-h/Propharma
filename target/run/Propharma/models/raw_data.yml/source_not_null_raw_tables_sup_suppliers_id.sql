select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select suppliers_id
from "propharma"."public"."suppliers"
where suppliers_id is null



      
    ) dbt_internal_test
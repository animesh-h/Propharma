select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select medicine_id
from "propharma"."public"."medicines"
where medicine_id is null



      
    ) dbt_internal_test
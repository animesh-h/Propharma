
      
  
    

  create  table "propharma"."snapshots"."snapshot_prescriptions"
  
  
    as
  
  (
    
    

    select *,
        md5(coalesce(cast(prescription_id as varchar ), '')
         || '|' || coalesce(cast(prescribed_date as varchar ), '')
        ) as dbt_scd_id,
        prescribed_date as dbt_updated_at,
        prescribed_date as dbt_valid_from,
        
  
  coalesce(nullif(prescribed_date, prescribed_date), null)
  as dbt_valid_to
from (
        

select * from "propharma"."public"."stg_prescriptions"
    ) sbq



  );
  
  
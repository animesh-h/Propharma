
  create view "propharma"."public"."stg_prescriptions__dbt_tmp"
    
    
  as (
    

with raw_prescriptions as (
    select * from "propharma"."public"."prescriptions"
)

select
    prescription_id,
    patient_id,
    medicine_id,
    prescribed_date,
    quantity::int as quantity
from raw_prescriptions
  );
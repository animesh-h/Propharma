
  create view "propharma"."public"."stg_patients__dbt_tmp"
    
    
  as (
    

with raw_patients as (
    select * from "propharma"."public"."patients"
)

select
    patient_id,
    name,
    dob::date as dob,
    gender
from raw_patients
  );
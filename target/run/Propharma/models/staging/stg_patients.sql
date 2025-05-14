
  
    

  create  table "propharma"."public"."stg_patients__dbt_tmp"
  
  
    as
  
  (
    with raw_patients as (
    select * from public.patients
)

select
    patient_id,
    name,
    dob::date as dob,
    gender
from raw_patients
  );
  
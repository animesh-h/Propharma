{{ config(
    materialized='view'
) }}

with raw_patients as (
    select * from {{ source('raw_tables','pat')}}
)

select
    patient_id,
    name,
    dob::date as dob,
    gender
from raw_patients
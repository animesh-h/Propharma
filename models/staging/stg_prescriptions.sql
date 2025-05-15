{{ config(
    materialized='view'
) }}

with raw_prescriptions as (
    select * from {{ source('raw_tables','pre')}}
)

select
    prescription_id,
    patient_id,
    medicine_id,
    prescribed_date,
    quantity::int as quantity
from raw_prescriptions
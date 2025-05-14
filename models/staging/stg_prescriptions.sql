{{ config(
    materialized='incremental',
    unique_key='prescription_id'
) }}

with raw_prescriptions as (
    select * from public.prescriptions
)

select
    prescription_id,
    patient_id,
    medicine_id,
    prescribed_date,
    quantity::int as quantity
from raw_prescriptions
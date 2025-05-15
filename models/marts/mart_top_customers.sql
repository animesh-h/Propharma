{{ config(
    materialized='incremental',
    unique_key='patient_id'
) }}

select
    p.patient_id,
    p.name,
    count(*) as purchase_count,
    sum(s.amount)::numeric(10,2) as total_value
from {{ ref('stg_sales') }} s
join {{ ref('stg_prescriptions') }} pr on s.prescription_id = pr.prescription_id
join {{ ref('stg_patients') }} p on pr.patient_id = p.patient_id
group by p.patient_id, p.name
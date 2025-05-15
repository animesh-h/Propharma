{{ config(
    materialized='incremental',
    unique_key='patient_id'
) }}

select pat.patient_id,
	pat.name AS "Patients Name",
	EXTRACT(YEAR FROM AGE(CURRENT_DATE, pat.dob)) AS "Patients Age",
	pre.prescribed_date as "Prescribed Date",
	pre.quantity as "Prescribed Quantity",
	med.name as "Medicine Name",
	sup.supplier_name as "Supplier Name",
	pre.quantity * med.price::numeric(10,2) as "Total Price",
	med.expiry_date AS "Medicine Expiry Date"
	from {{ ref('stg_patients') }} pat
	join {{ ref('stg_prescriptions') }} pre on pat.patient_id = pre.patient_id
	join {{ ref('stg_medicines') }} med on pre.medicine_id = med.medicine_id
	join {{ ref('stg_suppliers') }} sup on med.medicine_id = sup.medicine_id
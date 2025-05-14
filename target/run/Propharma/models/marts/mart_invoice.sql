
  create view "propharma"."public"."mart_invoice__dbt_tmp"
    
    
  as (
    select pat.patient_id,
	pat.name AS "Patients Name",
	EXTRACT(YEAR FROM AGE(CURRENT_DATE, pat.dob)) AS "Patients Age",
	pre.prescribed_date as "Prescribed Date",
	pre.quantity as "Prescribed Quantity",
	med.name as "Medicine Name",
	pre.quantity * med.price::numeric(10,2) as "Total Price",
	med.expiry_date AS "Medicine Expiry Date"
	from "propharma"."public"."stg_patients" pat
	join "propharma"."public"."stg_prescriptions" pre on pat.patient_id = pre.patient_id
	join "propharma"."public"."stg_medicines" med on pre.medicine_id = med.medicine_id
  );
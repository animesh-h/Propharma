
      
  
    

  create  table "propharma"."public"."mart_top_customers"
  
  
    as
  
  (
    

select
    p.patient_id,
    p.name,
    count(*) as purchase_count,
    sum(s.amount)::numeric(10,2) as total_value
from "propharma"."public"."stg_sales" s
join "propharma"."public"."stg_prescriptions" pr on s.prescription_id = pr.prescription_id
join "propharma"."public"."stg_patients" p on pr.patient_id = p.patient_id
group by p.patient_id, p.name
  );
  
  
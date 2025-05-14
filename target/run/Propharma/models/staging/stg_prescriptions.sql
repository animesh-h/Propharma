
      
        
        
        delete from "propharma"."public"."stg_prescriptions" as DBT_INTERNAL_DEST
        where (prescription_id) in (
            select distinct prescription_id
            from "stg_prescriptions__dbt_tmp182313890650" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."stg_prescriptions" ("prescription_id", "patient_id", "medicine_id", "prescribed_date", "quantity")
    (
        select "prescription_id", "patient_id", "medicine_id", "prescribed_date", "quantity"
        from "stg_prescriptions__dbt_tmp182313890650"
    )
  
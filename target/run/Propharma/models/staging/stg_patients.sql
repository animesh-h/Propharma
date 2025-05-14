
      
        
        
        delete from "propharma"."public"."stg_patients" as DBT_INTERNAL_DEST
        where (patient_id) in (
            select distinct patient_id
            from "stg_patients__dbt_tmp174004157349" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."stg_patients" ("patient_id", "name", "dob", "gender")
    (
        select "patient_id", "name", "dob", "gender"
        from "stg_patients__dbt_tmp174004157349"
    )
  
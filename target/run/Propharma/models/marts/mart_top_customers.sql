
      
        
        
        delete from "propharma"."public"."mart_top_customers" as DBT_INTERNAL_DEST
        where (patient_id) in (
            select distinct patient_id
            from "mart_top_customers__dbt_tmp172731487174" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."mart_top_customers" ("patient_id", "name", "purchase_count", "total_value")
    (
        select "patient_id", "name", "purchase_count", "total_value"
        from "mart_top_customers__dbt_tmp172731487174"
    )
  

      
        
        
        delete from "propharma"."public"."mart_invoice" as DBT_INTERNAL_DEST
        where (patient_id) in (
            select distinct patient_id
            from "mart_invoice__dbt_tmp204143454131" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."mart_invoice" ("patient_id", "Patients Name", "Patients Age", "Prescribed Date", "Prescribed Quantity", "Medicine Name", "Total Price", "Medicine Expiry Date")
    (
        select "patient_id", "Patients Name", "Patients Age", "Prescribed Date", "Prescribed Quantity", "Medicine Name", "Total Price", "Medicine Expiry Date"
        from "mart_invoice__dbt_tmp204143454131"
    )
  
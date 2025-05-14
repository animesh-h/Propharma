
      
        
        
        delete from "propharma"."public"."stg_suppliers" as DBT_INTERNAL_DEST
        where (supplier_id) in (
            select distinct supplier_id
            from "stg_suppliers__dbt_tmp174005345239" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."stg_suppliers" ("supplier_id", "supplier_name", "medicine_id", "last_supplied_date")
    (
        select "supplier_id", "supplier_name", "medicine_id", "last_supplied_date"
        from "stg_suppliers__dbt_tmp174005345239"
    )
  
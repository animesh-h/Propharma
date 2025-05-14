
      
        
        
        delete from "propharma"."public"."stg_medicines" as DBT_INTERNAL_DEST
        where (medicine_id) in (
            select distinct medicine_id
            from "stg_medicines__dbt_tmp182313181024" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."stg_medicines" ("medicine_id", "name", "category", "price", "expiry_date")
    (
        select "medicine_id", "name", "category", "price", "expiry_date"
        from "stg_medicines__dbt_tmp182313181024"
    )
  
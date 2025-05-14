
      
        
        
        delete from "propharma"."public"."stg_inventory" as DBT_INTERNAL_DEST
        where (medicine_id) in (
            select distinct medicine_id
            from "stg_inventory__dbt_tmp182312642071" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."stg_inventory" ("medicine_id", "stock_qty", "last_updated")
    (
        select "medicine_id", "stock_qty", "last_updated"
        from "stg_inventory__dbt_tmp182312642071"
    )
  
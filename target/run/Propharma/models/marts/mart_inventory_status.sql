
      
        
        
        delete from "propharma"."public"."mart_inventory_status" as DBT_INTERNAL_DEST
        where (medicine_id) in (
            select distinct medicine_id
            from "mart_inventory_status__dbt_tmp172730419283" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."mart_inventory_status" ("medicine_id", "name", "category", "price", "expiry_date", "stock_qty", "last_updated", "low_stock_flag")
    (
        select "medicine_id", "name", "category", "price", "expiry_date", "stock_qty", "last_updated", "low_stock_flag"
        from "mart_inventory_status__dbt_tmp172730419283"
    )
  
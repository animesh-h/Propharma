
      
        
        
        delete from "propharma"."public"."mart_expired_drugs" as DBT_INTERNAL_DEST
        where (medicine_id) in (
            select distinct medicine_id
            from "mart_expired_drugs__dbt_tmp204141883963" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."mart_expired_drugs" ("medicine_id", "name", "category", "price", "expiry_date", "stock_qty", "last_updated", "low_stock_flag", "expired")
    (
        select "medicine_id", "name", "category", "price", "expiry_date", "stock_qty", "last_updated", "low_stock_flag", "expired"
        from "mart_expired_drugs__dbt_tmp204141883963"
    )
  
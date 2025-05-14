
      
        
        
        delete from "propharma"."public"."stg_sales" as DBT_INTERNAL_DEST
        where (sale_id) in (
            select distinct sale_id
            from "stg_sales__dbt_tmp182314332508" as DBT_INTERNAL_SOURCE
        );

    

    insert into "propharma"."public"."stg_sales" ("sale_id", "prescription_id", "medicine_id", "sale_date", "quantity_sold", "amount")
    (
        select "sale_id", "prescription_id", "medicine_id", "sale_date", "quantity_sold", "amount"
        from "stg_sales__dbt_tmp182314332508"
    )
  
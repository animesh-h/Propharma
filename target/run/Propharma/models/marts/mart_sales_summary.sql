
      insert into "propharma"."public"."mart_sales_summary" ("sales_day", "sales_month", "total_sales_count", "total_quantity", "total_revenue")
    (
        select "sales_day", "sales_month", "total_sales_count", "total_quantity", "total_revenue"
        from "mart_sales_summary__dbt_tmp172730891614"
    )


  
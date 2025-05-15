select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        SELECT name
        FROM "propharma"."public"."medicines"
        WHERE TRIM(name) = ''

      
    ) dbt_internal_test
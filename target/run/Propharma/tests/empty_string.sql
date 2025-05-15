select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      empty_string.sql

      
    ) dbt_internal_test
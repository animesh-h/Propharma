{{ config(
    materialized='ephemeral'
) }}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2025-05-15' as date)",
    end_date="cast('2025-05-25' as date)"
) }}
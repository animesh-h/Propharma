{% snapshot snapshot_prescriptions %}
{{
    config(
      target_schema='snapshots',
      unique_key='prescription_id',
      strategy='check',
      check_cols=['prescribed_date']
    )
}}
select * from {{ ref('stg_prescriptions') }}
{% endsnapshot %}
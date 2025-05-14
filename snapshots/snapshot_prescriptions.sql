{% snapshot snapshot_prescriptions %}
{{
    config(
      target_schema='snapshots',
      unique_key='prescription_id',
      strategy='timestamp',
      updated_at='prescribed_date'
    )
}}
select * from {{ ref('stg_prescriptions') }}
{% endsnapshot %}
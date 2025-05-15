
      update "propharma"."snapshots"."snapshot_prescriptions"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "snapshot_prescriptions__dbt_tmp170237465570" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "propharma"."snapshots"."snapshot_prescriptions".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "propharma"."snapshots"."snapshot_prescriptions".dbt_valid_to is null;
      


    insert into "propharma"."snapshots"."snapshot_prescriptions" ("prescription_id", "patient_id", "medicine_id", "prescribed_date", "quantity", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."prescription_id",DBT_INTERNAL_SOURCE."patient_id",DBT_INTERNAL_SOURCE."medicine_id",DBT_INTERNAL_SOURCE."prescribed_date",DBT_INTERNAL_SOURCE."quantity",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "snapshot_prescriptions__dbt_tmp170237465570" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  
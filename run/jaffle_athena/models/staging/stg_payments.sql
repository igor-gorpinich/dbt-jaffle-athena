create or replace view
    "AwsDataCatalog"."jaffle_athena"."stg_payments"
  as
    with source as (
    select * from AwsDataCatalog.jaffle_athena.raw_payments
),
renamed as (
    select
        id as payment_id,
        order_id,
        payment_method,
        amount
    from source
)
select * from renamed

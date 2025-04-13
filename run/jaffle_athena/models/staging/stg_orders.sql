create or replace view
    "AwsDataCatalog"."jaffle_athena"."stg_orders"
  as
    with source as (

    select * from AwsDataCatalog.jaffle_athena.raw_orders

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from source

)

select * from renamed

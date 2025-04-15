{{ config(
    materialized='table',
    table_type='iceberg',
    on_schema_change='append_new_columns',
    partition_by={
      "field": "order_date",
      "data_type": "date"
    }
) }}


with orders as (
    select
        order_id,
        customer_id,
        order_date,
        status
    from {{ ref('stg_orders') }}
    {% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
    {% endif %}
),

payments as (
    select
        order_id,
        amount,
        payment_method
    from {{ ref('stg_payments') }}
),

order_payments as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        coalesce(p.amount, 0) as amount,
        p.payment_method
    from orders o
    left join payments p on o.order_id = p.order_id
)

select * from order_payments


with orders as (
    select
        order_id,
        customer_id,
        order_date,
        status
    from "AwsDataCatalog"."jaffle_athena"."stg_orders"
    
    where order_date > (select max(order_date) from "AwsDataCatalog"."jaffle_athena"."fct_orders")
    
),

payments as (
    select
        order_id,
        amount,
        payment_method
    from "AwsDataCatalog"."jaffle_athena"."stg_payments"
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
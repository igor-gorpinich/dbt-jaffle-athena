-- tests/no_negative_orders.sql
select *
from {{ ref('fct_orders') }}
where order_amount < 0
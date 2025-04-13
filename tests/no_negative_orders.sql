-- tests/no_negative_orders.sql
select *
from {{ ref('fct_orders') }}
where 1=1
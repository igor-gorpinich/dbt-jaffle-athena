-- tests/no_negative_orders.sql
select *
from "AwsDataCatalog"."jaffle_athena"."fct_orders"
where 1=0
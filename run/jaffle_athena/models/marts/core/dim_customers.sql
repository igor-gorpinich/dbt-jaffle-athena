create or replace view
    "AwsDataCatalog"."jaffle_athena"."dim_customers"
  as
    with customers as (

    select * from "AwsDataCatalog"."jaffle_athena"."stg_customers"

)

select
    customer_id,
    first_name,
    upper(last_name) as last_name
from customers

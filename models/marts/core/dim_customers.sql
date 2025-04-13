with customers as (

    select * from {{ ref('stg_customers') }}

)

select
    customer_id,
    first_name,
    last_name,
    'dummy' as dummy
from customers
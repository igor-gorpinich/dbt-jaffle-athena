

with source as (

    select * from {{ source('raw', 'raw_customers') }}

),

renamed as (

    select
        id       as customer_id,
        first_name as first_name,
        last_name as last_name
    from source

)

select * from renamed
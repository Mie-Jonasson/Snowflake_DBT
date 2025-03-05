with 

source as (

    select * from {{ source('stripe', 'payment') }} 

)

transformed as (

    select 
        orderid as order_id,
        created,
        amount / 100.0 as amount
    from source
)

select * from transformed
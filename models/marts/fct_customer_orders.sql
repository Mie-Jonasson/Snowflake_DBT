with 

-- Import

orders as (

    select *
    from {{ ref('stg_jaffle_shop__orders') }}

),

customers as (

    select *
    from {{ ref('stg_jaffle_shop__customers') }}

),

base_payment as (

    select *
    from {{ ref('stg_stripe__payment') }}

),


-- Logical CTEs

payments as (

    select 
        orderid as order_id, 
        max(created) as payment_finalized_date, 
        sum(amount) as total_amount_paid
    from base_payment
    where status <> 'fail'
    group by 1

),

paid_orders as (
    
    select 
        orders.order_id,
        orders.customer_id,
        orders.order_placed_at,
        orders.order_status,
        payments.total_amount_paid,
        payments.payment_finalized_date,
        customers.customer_first_name,
        customers.customer_last_name
    from orders
        left join payments on orders.order_id = payments.order_id
        left join customers on orders.customer_id = customers.customer_id 

),


-- Final CTE

final as (

    select
        *,

        row_number() over (
            order by order_id
        ) as transaction_seq,

        row_number() over (
            partition by customer_id 
            order by order_id
        ) as customer_sales_seq,

        case 
            when (
                rank() over (
                    partition by customer_id 
                    order by order_placed_at, order_id
                ) = 1
            ) then 'new'
            else 'return' 
        end as nvsr,

        sum(total_amount_paid) over (
            partition by customer_id
            order by order_id
        ) as customer_lifetime_value,

        first_value(order_placed_at) over (
            partition by customer_id
            order by order_placed_at
        ) as fdos

    from paid_orders
    order by order_id

)

-- simple select statement
select * from final
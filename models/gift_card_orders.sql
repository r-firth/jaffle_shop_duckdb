with final as (
    select
        order_id,
        customer_id,
        order_date,
        status,
        gift_card_amount,
        amount
    from {{ ref('orders') }}
    where gift_card_amount > 0
)

select * from final
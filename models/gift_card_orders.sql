SELECT
    order_id,
    customer_id,
    order_date,
    status,
    gift_card_amount,
    amount
FROM {{ source('jaffle_shop', 'orders') }}
WHERE gift_card_amount > 0
SELECT
    order_id
FROM
    {{ source('jaffle_shop', 'orders') }}
WHERE
    gift_card_amount > 0
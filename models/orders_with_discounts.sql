{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    order_date,
    status,
    credit_card_amount,
    coupon_amount,
    bank_transfer_amount,
    gift_card_amount,
    amount
FROM
    {{ source('jaffle_shop', 'orders') }}
WHERE
    coupon_amount > 0 OR gift_card_amount > 0

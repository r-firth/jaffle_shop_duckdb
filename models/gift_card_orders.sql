{{ config(
    materialized='table',
    sort='order_date',
    dist='order_id'
) }}

SELECT
    *
FROM
    {{ source('jaffle_shop', 'orders') }}
WHERE
    gift_card_amount > 0

{{ config(
    materialized='view'
) }}

SELECT *
FROM {{ source('jaffle_shop', 'orders') }}
WHERE gift_card_amount > 0
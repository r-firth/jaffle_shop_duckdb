{{
    config(
        materialized='view'
    )
}}

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM {{ source('jaffle_shop', 'customers') }} c
WHERE c.customer_id IN (
    SELECT
        o.customer_id
    FROM {{ source('jaffle_shop', 'orders') }} o
    WHERE o.gift_card_amount > 0
)
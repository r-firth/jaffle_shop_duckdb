WITH
  repeat_customer_orders AS (
    SELECT
      customer_id,
      order_date,
      LAG(order_date, 1, order_date) OVER (
        PARTITION BY
          customer_id
        ORDER BY
          order_date
      ) AS previous_order_date
    FROM {{ source('jaffle_shop', 'orders') }}
    WHERE
      customer_id IN (
        SELECT
          customer_id
        FROM {{ source('jaffle_shop', 'customers') }}
        WHERE
          number_of_orders > 1
      )
  )
SELECT *
FROM repeat_customer_orders

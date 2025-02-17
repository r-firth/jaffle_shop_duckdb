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
    FROM {{ ref('repeat_customer_orders') }}
  ),
  time_between_orders AS (
    SELECT
      customer_id,
      AVG(order_date - previous_order_date) AS avg_time_between_orders
    FROM repeat_customer_orders
    GROUP BY
      customer_id
  )
SELECT *
FROM time_between_orders

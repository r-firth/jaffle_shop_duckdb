SELECT
  AVG(avg_time_between_orders) AS overall_avg_time_between_orders
FROM {{ ref('time_between_orders') }}

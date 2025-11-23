SELECT
    o.order_date AS order_date,
    SUM(CASE WHEN o.order_date = f.first_order_date THEN 1 ELSE 0 END) AS first_visit,
    SUM(CASE WHEN o.order_date <> f.first_order_date THEN 1 ELSE 0 END) AS repeat_visit
FROM customer_orders AS o
JOIN (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
) AS f
  ON o.customer_id = f.customer_id
GROUP BY o.order_date
ORDER BY o.order_date;

############## Alternative using CTEs ##############

WITH first_order_per_customer AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
)
SELECT
    o.order_date AS order_date,
    SUM(CASE WHEN o.order_date = f.first_order_date THEN 1 ELSE 0 END) AS first_visit,
    SUM(CASE WHEN o.order_date <> f.first_order_date THEN 1 ELSE 0 END) AS repeat_visit
FROM customer_orders AS o
JOIN first_order_per_customer AS f
    ON o.customer_id = f.customer_id
GROUP BY o.order_date
ORDER BY o.order_date;
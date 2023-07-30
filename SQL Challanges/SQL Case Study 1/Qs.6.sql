WITH CTE AS(
	SELECT
		orders.order_id,
		orders.customer_id,
		customers.first_name || ' ' || customers.last_name AS Customers
		
	FROM orders
	JOIN customers ON
	orders.customer_id = customers.customer_id
)

SELECT
	CTE.Customers,
	COUNT(DISTINCT(order_items.product_id)) AS 'Number of Products'

FROM order_items
LEFT JOIN CTE ON
order_items.order_id = CTE.order_id

GROUP BY
	CTE.Customers
ORDER BY
	COUNT(DISTINCT(order_items.product_id)) DESC
LIMIT 3

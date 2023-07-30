WITH CTE AS(
	SELECT
		orders.order_id,
		customers.first_name || ' ' || customers.last_name AS Customers

	FROM orders
	JOIN customers
	ON orders.customer_id = customers.customer_id

	GROUP BY orders.order_id
)
SELECT
	CTE.order_id,
	CTE.Customers,
	MAX(products.price) AS Maximum_Price

FROM order_items
JOIN products
JOIN CTE
ON order_items.product_id = products.product_id
AND order_items.order_id = CTE.order_id

GROUP BY CTE.customers
ORDER BY MAX(products.price) DESC


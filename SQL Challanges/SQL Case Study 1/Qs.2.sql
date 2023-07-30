SELECT
	customers.customer_id,
	customers.first_name || ' ' ||customers.last_name AS Customer,
	COUNT(orders.customer_id) AS 'Number of Orders'

FROM orders
JOIN customers ON
orders.customer_id = customers.customer_id

GROUP BY
	customers.customer_id
ORDER BY
	COUNT(orders.customer_id) DESC
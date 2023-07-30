SELECT
	customers.customer_id,
	customers.first_name || ' ' || customers.last_name AS Customer,
	MIN(orders.order_date) AS 'First Order Date'

FROM customers
LEFT JOIN orders ON
customers.customer_id = orders.customer_id

GROUP BY
	customers.customer_id, Customer

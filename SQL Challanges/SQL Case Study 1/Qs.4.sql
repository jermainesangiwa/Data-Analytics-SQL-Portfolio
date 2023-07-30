SELECT
	orders.order_id,
	STRFTIME('%d', orders.order_date) AS 'Order Day',
	products.price * SUM(order_items.quantity) AS Revenue

FROM order_items
JOIN products 
JOIN orders ON
order_items.product_id = products.product_id AND
order_items.order_id = orders.order_id

GROUP BY
	orders.order_id
ORDER BY
	Revenue DESC


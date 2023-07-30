SELECT
	products.product_name AS 'Product Name',
	SUM(order_items.quantity) AS Quantity

FROM order_items
JOIN products ON
order_items.product_id = products.product_id

GROUP BY
	products.product_name
ORDER BY
	Quantity

SELECT
	products.product_name AS Product,
	products.price AS Price,
	order_items.quantity AS Quantity,
	products.price * order_items.quantity AS Revenue

FROM order_items
JOIN products ON
order_items.product_id = products.product_id

GROUP BY
	products.product_name
ORDER BY
	Product
SELECT
	order_items.order_id,
	SUM(products.price) * SUM(order_items.quantity) AS Revenue,
	CASE
		WHEN (SUM(products.price) * SUM(order_items.quantity))>300 THEN 'Expensive'
		WHEN (SUM(products.price) * SUM(order_items.quantity))>100 THEN 'Affordable'
		ELSE 'Cheap'
	END AS Description
	
FROM order_items
JOIN products ON
order_items.product_id = products.product_id

GROUP BY order_items.order_id

ORDER BY order_items.order_id

WITH CTE AS(
	SELECT
		order_items.order_id,
		SUM(products.price) * SUM(order_items.quantity) AS Order_Revenue
	
	FROM order_items
	JOIN products ON
	order_items.product_id = products.product_id
	
	GROUP BY order_items.order_id
),
CTE2 AS(
	SELECT 
		Order_Revenue, 
		ROW_NUMBER() OVER (ORDER BY Order_Revenue) AS Row_Num,
		COUNT(*) OVER () AS Total_Count
		
	FROM CTE 
)
SELECT 
	ROUND(AVG(Order_Revenue), 2) AS Median
	
FROM CTE2

WHERE
	Row_Num IN ((Total_Count + 1)/2, (Total_Count + 2)/2) 
	OR (Total_Count % 2 = 1 AND Row_Num = (Total_Count + 1)/2)
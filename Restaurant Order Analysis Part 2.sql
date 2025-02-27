-- 1) View the order_details table. 

SELECT * FROM order_details;

-- 2) What is the date range of the table?

SELECT Min(order_date) AS `From`,Max(order_date) AS `To` 
FROM order_details;


-- 3) How many orders were made within this date range? 

SELECT count(distinct(order_id)) as Total_orders
from order_details;

-- 4) How many items were ordered within this date range?

SELECT count(*) as Total_orders
from order_details;

-- 5) Which orders had the most number of items?

SELECT order_id, count(item_id) AS NUM_ITEMS
FROM order_details
GROUP BY ORDER_ID
ORDER BY NUM_ITEMS DESC;

-- 6) How many orders had more than 12 items?
SELECT COUNT(*) FROM
	(
    SELECT order_id, count(item_id) AS NUM_ITEMS
	FROM order_details
	GROUP BY ORDER_ID
	HAVING NUM_ITEMS > 12
    ) 	
AS Num_orders;
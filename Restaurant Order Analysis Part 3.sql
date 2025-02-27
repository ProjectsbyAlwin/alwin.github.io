-- 1) Combine the menu_items and order_details tables into a single table
SELECT * FROM order_details;
SELECT * FROM menu_items;

SELECT * FROM order_details od
left join menu_items mi ON od.item_id = mi.menu_item_id;

-- 2) What were the least and most ordered items? What categories were they in?

SELECT item_name, category, count(order_details_id) as total_orders from order_details od
left join menu_items mi ON od.item_id = mi.menu_item_id
group by item_name, category
order by total_orders;

SELECT item_name, category, count(order_details_id) as total_orders from order_details od
left join menu_items mi ON od.item_id = mi.menu_item_id
group by item_name, category
order by total_orders desc;

-- 3) What were the top 5 orders that spent the most money?

SELECT order_id, sum(price) as Amount FROM order_details od
left join menu_items mi ON od.item_id = mi.menu_item_id
group by order_id
order by amount desc
limit 5;

-- 4) View the details of the highest spend order. Which specific items were purchased?

SELECT item_name, category, count(item_id) as num_items FROM order_details od
left join menu_items mi ON od.item_id = mi.menu_item_id where order_id = 440
group by item_name, category
order by num_items desc;

-- 5) BONUS: View the details of the top 5 highest spend orders

SELECT order_id, category, count(item_id) as total_items FROM order_details od
left join menu_items mi ON od.item_id = mi.menu_item_id 
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category; 
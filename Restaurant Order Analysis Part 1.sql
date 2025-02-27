use restaurant_db;

-- 1) View the menu items in the table

SELECT * FROM menu_items;

-- 2) Find the number of items in the menu?

SELECT COUNT(*) AS Total_Count
FROM menu_items;

-- 3) Find the least and most expensive items on the menu?

SELECT * FROM menu_items
ORDER BY price DESC
LIMIT 1;

SELECT * FROM menu_items
WHERE price = (SELECT MIN(price) FROM menu_items);

-- 4) How many Italian dishes are on the menu?

SELECT count(*) from menu_items
WHERE category = "Italian";

-- 5) What are the least and most expensive Italian dishes on the menu?

SELECT * FROM menu_items
WHERE category = "Italian"
ORDER BY price;

SELECT * FROM menu_items
WHERE category = "Italian"
ORDER BY price DESC;

-- 6) How many dishes are in each category? 

SELECT category, count(category) as Num_dishes FROM menu_items
GROUP BY category;


-- 7) What is the average dish price within each category?

SELECT category, avg(price) AS Average_Price FROM menu_items 
GROUP BY category
ORDER BY Average_Price;
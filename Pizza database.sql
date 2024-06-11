select * from pizza_sales

select SUM(total_price) AS Total_Revenue from pizza_sales 

select SUM(total_price)/ COUNT(Distinct order_id) AS average_order_value from pizza_sales

select SUM(quantity) AS total_pizza_sold from pizza_sales

select COUNT(DISTINCT order_id) AS total_orders from pizza_sales

select CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS  average_pizzas_per_order
from pizza_sales

SELECT DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) as Month_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC

SELECT pizza_category, sum(total_price) as Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE month(order_date)=1) AS PCT
FROM pizza_sales 
WHERE month(order_date)=1
GROUP BY pizza_category

SELECT pizza_size, sum(total_price) as Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales 
WHERE DATEPART(quarter, order_date)=1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales 
WHERE DATEPART(quarter, order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT TOP 5 pizza_name, SUM(total_price) as total_revenue from pizza_sales
Group by pizza_name
order by total_revenue desc

SELECT TOP 5 pizza_name, SUM(quantity) as total_quantity from pizza_sales
Group by pizza_name
order by total_quantity desc







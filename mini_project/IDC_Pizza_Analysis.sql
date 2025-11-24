-- Phase 1: (Foundation & Inspection)
-- 1. List all unique pizza categories
-- select
-- 	distinct category
-- from pizza_types

-- 2. Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
-- select
-- 	pizza_type_id,
--     name,
--     coalesce(ingredients, 'Missing Data') as ingredients
-- from pizza_types limit 5

-- 3. Check for pizzas missing a price 
-- select * from pizzas where price is null

-- Phase 2:  (Filtering & Exploration)
-- 1. Orders placed on '2015-01-01'
-- select * from orders
-- where date = '2015-01-01'

-- 2. List pizzas with price descending.
-- select * from pizzas order by price desc

-- 3. Pizzas sold in sizes 'L' or 'XL'.
-- select * from pizzas where size in ('L', 'XL')

-- 4. Pizzas priced between $15.00 and $17.00.
-- select * from pizzas where price between 15.00 and 17.00

-- 5. Pizzas with "Chicken" in the name.
-- select * from pizza_types where lower(name) like '%chicken%'

-- 6. Orders on '2015-02-15' or placed after 8 PM.
-- select * from orders where date = '2015-02-15' or time>='20:00:00'

-- Phase 3: (Sales Performance)
 -- 1. Total quantity of pizzas sold (SUM).
 -- select sum(quantity) as total_pizzas_sold from order_details
 
 -- 2. Average pizza price (AVG).
 -- select avg(price) as avg_pizza_price from pizzas
 
-- 3. Total order value per order
-- select
-- 	od.order_id,
--     sum(od.quantity*p.price) as order_total
-- from order_details od
-- join pizzas p
-- on od.pizza_id = p.pizza_id
-- group by od.order_id

-- 4. Total quantity sold per pizza category 
-- select 
-- 	pt.category,
--     sum(od.quantity) as total_qty_sold
-- from order_details od
-- join pizzas p
-- on od.pizza_id = p.pizza_id
-- join pizza_types pt
-- on p.pizza_type_id = pt.pizza_type_id
-- group by pt.category
-- order by total_qty_sold desc

-- 5. Categories with more than 5,000 pizzas sold
-- select
-- 	pt.category,
--     sum(od.quantity) as total_qty_sold
-- from order_details od
-- join pizzas p
-- on od.pizza_id = p.pizza_id
-- join pizza_types pt
-- on p.pizza_type_id = pt.pizza_type_id
-- group by pt.category
-- having sum(od.quantity) > 5000
-- order by total_qty_sold desc

-- 6. Pizzas never ordered (LEFT/RIGHT JOIN).
-- select p.* from pizzas p left join order_details od on p.pizza_id = od.pizza_id where od.order_id is null

-- 7. Price differences between different sizes of the same pizza
-- select 
-- 	p1.pizza_type_id,
--     p1.size as size1,
--     p1.price as price1,
--     p2.size as size2,
--     p2.price as price2,
--     p2.price - p1.price as price_difference
-- from pizzas p1
-- join pizzas p2
-- on p1.pizza_type_id = p2.pizza_type_id and p1.size<p2.size
-- order by p1.pizza_type_id, size1, size2
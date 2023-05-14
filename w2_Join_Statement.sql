use littlelemondb;

select c.customer_id, c.name as FullName,  order_id,  cast((quantity * price) as decimal(7,2)) as Cost, m.Cuisine as MenuName, m.CourseName from orders o 
join menu m on o.menu_id = m.menu_id 
join bookings b on o.booking_id = b.booking_id
join customer c on b.customer_id = c.customer_id
where quantity * price > 150
order by quantity * price ;
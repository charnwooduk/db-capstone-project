use littlelemondb;

create view OrdersView as
select order_id, quantity, cast((quantity * price) as decimal(7,2))  as Cost from orders o 
join menu m on o.menu_id = m.menu_id 
where quantity > 2;

select * from ordersview;
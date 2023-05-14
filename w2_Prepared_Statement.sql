use littlelemondb;

PREPARE GetOrderDetail from 'select order_ID as OrderID, quantity as Quantity, cast((quantity * price) as decimal(7,2)) as Cost from orders o join menu m on o.menu_id = m.menu_id where order_id = ?';

set @orderid = 2;
execute GetOrderDetail using @orderid;
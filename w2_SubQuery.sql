use littlelemondb;

select Cuisine as MenuName from menu where menu.menu_id = any (select orders.menu_id from orders where quantity > 2);
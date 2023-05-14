use littlelemondb;

drop procedure if exists GetMaxQuantity;
create procedure GetMaxQuantity()
select max(quantity) as "Max Quantity In Order" from orders;

call getmaxquantity();
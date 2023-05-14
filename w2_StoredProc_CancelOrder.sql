use littlelemondb;

drop procedure if exists CancelOrder;

delimiter //
create procedure CancelOrder(orderid int)
begin
	if ((select count(*) from orders where order_id = orderid) >= 1) then
    begin
		delete from orderstatus where order_id = orderid;
		delete from orders where order_id = orderid;
        select CONCAT("Order ", orderid , " is cancelled") as Confirmation;
	end;
    else select CONCAT("Order ", orderid, " NotFound") as Confirmation;
    end if;
end; 
//
 delimiter  ; 
            
 call CancelOrder(7);      
		
        
use littlelemondb;


drop procedure if exists CancelBooking;

delimiter //
create procedure CancelBooking(bookid int)
begin
		delete from bookings where booking_id = bookid;
        select CONCAT("Booking ", bookid , " cancelled") as "Confirmation";
	
end;       // 
delimiter ;

call CancelBooking(5);
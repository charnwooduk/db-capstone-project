use littlelemondb;

-- also need to ensure that table is not already booked on the new date!! 

drop procedure if exists UpdateBooking;

delimiter //
create procedure UpdateBooking(bookid int, bookdate date)
begin
	if ((select count(*) from bookings b where b.booking_date = bookdate and b.table_num in (select table_num from bookings where booking_id = bookid)) > 0) then 
    begin
		select CONCAT("Table is already booked on that date - sorry") as "Confirmation";
	end;
    else
    begin
        update bookings set booking_date = bookdate where booking_id = bookid;
		select CONCAT("Booking ", bookid , " updated") as "Confirmation";
	end;
    END IF;
end;       // 
delimiter ;

-- run this twice, the first time booking should be confirmed, the 2nd time it should fail
call UpdateBooking(1, "2023-04-13");
use littlelemondb;

drop procedure if exists CheckBooking;
delimiter //
create procedure CheckBooking(bookdate date, tabnum int)
begin
	if ((select count(*) from bookings b where b.booking_date = bookdate and b.table_num = tabnum) >= 1) then
		select CONCAT("Table ", tabnum, " is already booked") as "Booking Status";
	else
      	select "Table is Free" as  "Booking Status";
	end if;
end; //
delimiter ;

call CheckBooking("2023-10-13", 1);
call CheckBooking("2023-10-13", 2);

            
        
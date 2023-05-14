use littlelemondb;

-- note the task description in the course is incorrect, the stored procedure needs 3 inpput parameters, 
-- they forgot to mention the customer_id is also needed to make a booking

drop procedure if exists AddValidBooking;

delimiter //
create procedure AddValidBooking(custid int, bookdate date, tblnum int)
begin
	START TRANSACTION;
	insert into bookings (customer_id, booking_date, table_num)
			values
            (custid, bookdate, tblnum );
	if ((select count(*) from bookings b where b.booking_date = bookdate and b.table_num = tblnum) > 1) then 
    begin
		select CONCAT("Table ", tblnum, " is already booked - booking CANCELLED") as "Booking status";
        ROLLBACK;
	end;
    else
    begin
        COMMIT ;
        select CONCAT("Table ", tblnum, " booking CONFIRMED") as "Booking status";
	end;
    END IF;
end;       // 
delimiter ;

-- run this twice, the first time booking should be confirmed, the 2nd time it should fail
call AddValidBooking(1, "2023-05-13", 2);
            
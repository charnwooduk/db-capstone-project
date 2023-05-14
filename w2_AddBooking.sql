use littlelemondb;

-- this is basicly the same as addvalidbooking, except that it does not require transaction in the question
-- booking_id is autoincriment in my schema, so is not necessary as input parameter

drop procedure if exists AddBooking;

delimiter //
create procedure AddBooking(custid int, bookdate date, tblnum int)
begin
	if ((select count(*) from bookings b where b.booking_date = bookdate and b.table_num = tblnum) > 1) then 
    begin
		select CONCAT("Table ", tblnum, " is already booked - booking CANCELLED") as "Confirmation";
	end;
    else
    begin
        insert into bookings (customer_id, booking_date, table_num)
			values
            (custid, bookdate, tblnum );
        select "New Booking added" as "Confirmation";
	end;
    END IF;
end;       // 
delimiter ;

-- run this twice, the first time booking should be confirmed, the 2nd time it should fail
call AddValidBooking(1, "2023-04-13", 2);
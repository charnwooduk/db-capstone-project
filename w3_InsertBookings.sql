
-- note my bookings table has autoincrement set on its booking_id column, therefore this would not be in the insert statement

use littlelemondb;

insert into bookings (customer_id, booking_date, table_num)
values
(1, str_to_date("10-10-2023", "%m-%d-%Y"), 5),
(3, str_to_date("11-12-2023", "%m-%d-%Y"), 3),
(2, str_to_date("10-11-2023", "%m-%d-%Y"), 2),
(1, str_to_date("10-13-2023", "%m-%d-%Y"), 2)

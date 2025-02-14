USE littlelemondb;
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER $$

CREATE PROCEDURE CheckBooking(booking_date DATE, table_no int)
BEGIN
	DECLARE number_of_bookings INT;
    SELECT COUNT(BookingID) INTO number_of_bookings
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNo = table_no;
    SELECT 
		CASE 
			WHEN number_of_bookings > 0 THEN CONCAT('Table ', table_no, ' is already booked')
            ELSE CONCAT('Table ', table_no, ' is available on ', booking_date)
		END AS 'Booking Status';
END $$
DELIMITER ;

CALL CheckBooking('2025-02-01', 12);
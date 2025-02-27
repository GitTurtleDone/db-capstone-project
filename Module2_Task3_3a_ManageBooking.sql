USE littlelemondb;

DROP PROCEDURE IF EXISTS ManageBooking;

DELIMITER $$

CREATE PROCEDURE ManageBooking(booking_date DATE, table_no INT)
BEGIN
	DECLARE number_of_bookings, max_booking_id INT;
	START TRANSACTION;
    SELECT Max(BookingID) INTO max_booking_id
    FROM Bookings;
    INSERT INTO Bookings(BookingID, BookingDate, TableNo)
    VALUES 
    (max_booking_id+1, booking_date, table_no);
    
    SELECT COUNT(BookingID) INTO number_of_bookings
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNo = table_no;
	IF number_of_bookings > 1 THEN
		ROLLBACK;
        SELECT CONCAT('Table ', table_no, ' is already booked on ', booking_date, ' - booking cancelled.') AS 'Booking Status';
    ELSE 
		COMMIT;
		SELECT CONCAT('Table ', table_no, ' has been booked for ', booking_date, '.') AS 'Booking Status';
	END IF;

END $$
DELIMITER ;

CALL ManageBooking('2025-02-28', 10);
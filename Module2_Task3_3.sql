USE littlelemondb;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER $$

CREATE PROCEDURE AddValidBooking(booking_date DATE, table_no INT)
BEGIN
	DECLARE number_of_bookings INT;
	START TRANSACTION;
    INSERT INTO Bookings(BookingDate, TableNo)
    VALUES 
    (booking_date, table_no);
    
    SELECT COUNT(BookingID) INTO number_of_bookings
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNo = table_no;
	IF number_of_bookings > 1 THEN
		ROLLBACK;
        SELECT CONCAT('Table ', table_no, ' is already booked - booking cancelled') AS 'Booking Status';
    ELSE 
		COMMIT;
		SELECT CONCAT('Table ', table_no, ' has been booked for ', booking_date) AS 'Booking Status';
	END IF;

END $$
DELIMITER ;

CALL AddValidBooking('2025-02-15', 6);

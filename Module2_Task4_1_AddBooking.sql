USE littlelemondb;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER $$

CREATE PROCEDURE AddBooking(booking_date DATE, table_no INT, customer_id INT)
BEGIN
	DECLARE number_of_bookings INT;
	START TRANSACTION;
    INSERT INTO Bookings(BookingDate, TableNo, CustomerID)
    VALUES 
    (booking_date, table_no, customer_id);
    
    SELECT COUNT(BookingID) INTO number_of_bookings
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNo = table_no;
	IF number_of_bookings > 1 THEN
		ROLLBACK;
        SELECT CONCAT('Table ', table_no, ' is already booked - booking cancelled') AS 'Booking Status';
    ELSE 
		COMMIT;
		SELECT CONCAT('Table ', table_no, ' has been booked for ', booking_date, '. New booking added.') AS 'Booking Status';
	END IF;

END $$
DELIMITER ;

CALL AddBooking('2025-02-15', 4, 3);
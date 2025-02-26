USE littlelemondb;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER $$

CREATE PROCEDURE AddBooking(booking_id INT, customer_id INT, table_no INT, booking_date DATE)
BEGIN
	DECLARE number_of_bookings, number_of_bookingIDs INT;
	
    -- Insert into to Customers table in case the customer does not exist to avoid the foreign key constraint error
    INSERT IGNORE INTO Customers(CustomerID) VALUES (customer_id);
    -- Check if the BookingID exists, if it does -> ouput a message, if not carry on with the addition of booking
    SELECT COUNT(BookingID) INTO number_of_bookingIDs
    FROM Bookings WHERE BookingID = booking_id;
    IF number_of_bookingIDs > 0 THEN
		SELECT CONCAT('The BookingID - ', booking_id, ' has been taken. Select another one.') AS 'Message';
    ELSE
		START TRANSACTION;
        INSERT INTO Bookings(BookingID, BookingDate, TableNo, CustomerID)
		VALUES 
		(booking_id, booking_date, table_no, customer_id);
		
		SELECT COUNT(BookingID) INTO number_of_bookings
		FROM Bookings
		WHERE BookingDate = booking_date AND TableNo = table_no;
		IF number_of_bookings > 1 THEN
			ROLLBACK;
			SELECT CONCAT('Table ', table_no, ' is already booked - booking cancelled.') AS 'Booking Status';
		ELSE 
			COMMIT;
			SELECT CONCAT('Table ', table_no, ' has been booked for ', booking_date, '. New booking added.') AS 'Booking Status';
		END IF;
	END IF;
END $$
DELIMITER ;

CALL AddBooking(99, 99, 99, '2022-12-10');
USE littlelemondb;
DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER $$
CREATE PROCEDURE UpdateBooking(booking_id INT, update_booking_date DATE)
BEGIN
	-- Check if the booking_id exists first
    DECLARE number_of_bookingids INT;
    SELECT COUNT(BookingID) INTO number_of_bookingids
    FROM Bookings WHERE BookingID = booking_id;
    IF number_of_bookingids = 0 THEN
		-- Generate a message if the BookingID does not exist.
		SELECT CONCAT('The BookingID ', booking_id, ' does not exist. Select another one.') AS 'Message';
	ELSE
		UPDATE Bookings
		SET BookingDate = update_booking_date
		WHERE BookingID = booking_id;
		SELECT CONCAT('Booking ', booking_id, ' updated.') AS Confirmation;
	END IF;
END
$$
DELIMITER ;

CALL UpdateBooking(99, '2025-02-18');

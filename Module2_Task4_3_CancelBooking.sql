USE littlelemondb;
DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER $$
CREATE PROCEDURE CancelBooking(booking_id INT)
BEGIN
	-- Check if the booking_id exists first
    DECLARE number_of_bookingids INT;
    SELECT COUNT(BookingID) INTO number_of_bookingids
    FROM Bookings WHERE BookingID = booking_id;
    IF number_of_bookingids = 0 THEN
		-- Generate a message if the BookingID does not exist.
		SELECT CONCAT('The BookingID ', booking_id, ' does not exist. Select another one.') AS 'Message';
	ELSE
		DELETE FROM Bookings
		WHERE BookingID = booking_id;
		SELECT CONCAT('Booking ', booking_id, ' cancelled.') AS Confirmation;
	END IF;
END
$$
DELIMITER ;

CALL CancelBooking(99);

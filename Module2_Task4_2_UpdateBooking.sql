USE littlelemondb;
DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER $$
CREATE PROCEDURE UpdateBooking(booking_id INT, update_booking_date DATE)
BEGIN
	UPDATE Bookings
    SET BookingDate = update_booking_date
    WHERE BookingID = booking_id;
    SELECT CONCAT('Booking ', booking_id, ' updated.') AS Confirmation;
END
$$
DELIMITER ;

SELECT * FROM Bookings ORDER BY BookingDate ASC;
CALL UpdateBooking(20, '2025-02-18');

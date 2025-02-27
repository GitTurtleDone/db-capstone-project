-- @ by Thai Giang Dang, 08/02/2025, Christchurch New Zealand

USE littlelemondb;
/* ****************************** POPULATE TABLES ************************* */
INSERT INTO Staff(StaffID, FirstName, LastName, Role, Address, Phone, Email, Salary) VALUES
(1, 'Mario', 'Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL',351258074,'Mario.g@littlelemon.com',70000),
(2, 'Adrian', 'Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL',351474048,'Adrian.g@littlelemon.com', 65000),
(3, 'Giorgos', 'Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL',351970582,'Giorgos.d@littlelemon.com', 50000),
(4, 'Fatma', 'Kaya','Assistant Chef','132  Bay Lane, Chicago, IL',351963569,'Fatma.k@littlelemon.com', 45000),
(5, 'Elena', 'Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL',351074198,'Elena.s@littlelemon.com', 40000),
(6, 'John', 'Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL',351584508,'John.m@littlelemon.com', 35000);

INSERT INTO Items (ItemID, ItemName, Type, Price)
VALUES
-- italian
-- 'Classic Italian'
(1, 'Bruschetta', 'Starter', 12),
(2, 'Spaghetti Carbonara', 'Course', 36),
(3, 'Tiramisu', 'Dessert', 12),
-- 'Northern  Italian'
(4, 'Prosciutto e Melone', 'Starter', 12),
(5, 'Risotto alla Milanese', 'Course', 30),
(6,'Panna Cotta', 'Dessert', 14),
-- 'Classic Greek'
(7, 'Tzatziki', 'Starter', 10),
(8, 'Moussaka', 'Course', 24),
(9, 'Galaktobroureko', 'Dessert', 12),
-- 'Seafood-Inspired'
(10, 'Grilled Octopus', 'Starter', 30),
(11, 'Psari Plaki', 'Course', 36),
(12, 'Loukoumades', 'Dessert', 12),
-- Turkish
-- 'Classic Turkish'
(13, 'Mercimek Corbasi', 'Starter', 8),
(14, 'Kebap', 'Course', 24),
(15, 'Baklava', 'Dessert', 10),
-- 'Ottoman-Inspired'
(16, 'Yaprak Sarma', 'Starter', 12),
(17, 'Hunkar Begendi ', 'Course', 30),
(18, 'Kunefe', 'Dessert', 14),

(19, 'Olives','Starter', 10),
(20, 'Flatbread','Starter', 10),
(21, 'Minestrone', 'Starter', 16), -- Italian Soup
(22, 'Tomato bread','Starter', 16),
(23, 'Falafel', 'Starter', 14), -- Egyptian/Middle East broad beans chickpeas
(24, 'Hummus', 'Starter', 10), -- Middle Eat chickpeas
(25, 'Greek salad', 'Course', 30),
(26, 'Bean soup', 'Course', 24),
(27, 'Pizza', 'Course', 30),
(28, 'Greek yoghurt','Dessert', 14),
(29, 'Ice cream', 'Dessert', 12),
(30, 'Cheesecake', 'Dessert', 8),
(31, 'Athens White wine', 'Drink', 50),
(32, 'Corfu Red Wine', 'Drink', 60), -- Greek
(33, 'Turkish Coffee', 'Drink', 20),
(34, 'Turkish Coffee', 'Drink', 20),
(35, 'Kabasa', 'Course', 14),
-- greek
(36, 'Lemon bougatsa', 'Dessert', 20),
(37,'Loukomadies', 'Dessert', 10); 
 

INSERT INTO Menus (MenuID, MenuName, Cuisine, Starter, Course, Dessert)
VALUES
(1, 'Classic Italian', 'Italian', 'Bruschetta', 'Spaghetti Carbonara', 'Tiramisu'),
(2, 'Northern  Italian',  'Italian',  'Prosciutto e Melone', 'Risotto alla Milanese', 'Panna Cotta'),
(3, 'Classic Greek', 'Greek', 'Tzatziki', 'Moussaka', 'Galaktobroureko'),
(4, 'Seafood-Inspired',  'Greek',  'Grilled Octopus', 'Psari Plaki', 'Loukoumades'),
(5, 'Mercimek Corbasi', 'Turkish', 'Mercimek Corbasi', 'Kebap', 'Baklava'),
(6, 'Northern  Italian',  'Turkish',  'Yaprak Sarma', 'Hunkar Begendi', 'Kunefe'),
(7, 'Lunch Special', 'Mixed', 'Flatbread', 'Bean soup', 'Ice cream');




INSERT INTO MenuItems (MenuItemID, MenuID, ItemID)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15),
(16, 6, 16),
(17, 6, 17),
(18, 6, 18),
(19, 7, 20),
(20, 7, 26),
(21, 7, 29);

-- Get the total price of all items in the menu
DROP FUNCTION IF EXISTS GetMenuPrice;
DELIMITER $$
CREATE FUNCTION GetMenuPrice(menu_id INT)
RETURNS DECIMAL
DETERMINISTIC
BEGIN
	DECLARE menu_price DECIMAL(4,2);
    SELECT SUM(i.Price) INTO menu_price
    FROM MenuItems AS mi LEFT JOIN Items AS i ON mi.ItemID = i.ItemID
    WHERE mi.MenuID = menu_id;
    RETURN menu_price;
END$$
DELIMITER ;
UPDATE  Menus
SET TotalPrice = GetMenuPrice(MenuID) WHERE MenuID < 8;

INSERT INTO Customers(CustomerID, FirstName, LastName, Email, Phone)
VALUES
(1, 'Anna','Iversen','anna.iversen@gmail.com',351259642),
(2, 'Joakim', 'Iversen', 'j.iversen@yahoo.com', 352253781),
(3, 'Vanessa', 'McCarthy', 'vanessa.m@globalsuperstore.com', 361255597),
(4, 'Marcos', 'Romero', 'marcos.romero2208@mangatagallo.us', 451252112),
(5, 'Hiroki', 'Yamane', 'hyamane.smile@mitsubishi.com', 359439642),
(6, 'Diana', 'Pinto', 'diana.pinto@finance.org.us', 751100242);

INSERT INTO Bookings (BookingID, BookingDate, BookingTime, TableNo, CustomerID)
VALUES
(1, '2022-10-10', '12:50:00', 5, 1),
(2, '2022-11-12', '17:30:00', 3, 3),
(3, '2022-10-11', '18:10:00', 2, 2),
(4, '2025-10-13', '20:30:00', 2, 1),
(5, '2025-02-01', '18:50:00', 12, 1),
(6, '2025-02-07', '12:30:00', 10, 2),
(7, '2025-02-08', '19:10:00', 12, 6),
(8, '2025-02-12', '20:00:00', 1, 3),
(9, '2025-02-13', '11:30:00', 2, 2),
(10, '2025-02-14', '12:00:00', 5, 5),
(11, '2025-02-14', '19:10:00', 10, 4),
(12, '2025-02-14', '20:20:00', 6, 6);



INSERT INTO Orders (OrderID, Quantity, BookingID, MenuID, StaffID)
VALUES
(1, 1, 1, 2, 1),
(2, 2, 2, 7, 5),
(3, 1, 3, 4, 2),
(4, 5, 4, 6, 6),
(5, 3, 5, 7, 6),
(6, 2, 8, 1, 6),
(7, 4, 7, 3, 6);

UPDATE Orders
SET TotalCost = GetMenuPrice(MenuID) * Quantity WHERE MenuID < 8;

DROP FUNCTION IF EXISTS GetDeliveryDate;
DELIMITER $$
CREATE FUNCTION GetDeliveryDate(order_id INT)
RETURNS DATE
DETERMINISTIC
BEGIN
	DECLARE delivery_date DATE;
    SELECT 
		CASE 
			WHEN b.BookingDate <= CURDATE() AND o.StaffID IN (1,2) THEN b.BookingDate
            ELSE NULL
		END
	INTO delivery_date
    FROM Orders AS o LEFT JOIN Bookings AS b ON o.BookingID = b.BookingID
    WHERE o.OrderID = order_id;
    RETURN delivery_date;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS GetDeliveryStatus;
DELIMITER $$
CREATE FUNCTION GetDeliveryStatus(order_id INT)
RETURNS VARCHAR(20) 
DETERMINISTIC
BEGIN
	DECLARE delivery_status VARCHAR(20);
    SELECT 
		CASE 
			WHEN StaffID IN (1,2) THEN 'Order paid'
			WHEN StaffID IN (3,4,5) THEN 'Order served'
			WHEN StaffID = 6 THEN 'To be served'
		END AS order_status
	INTO delivery_status
	FROM Orders
    WHERE OrderID = order_id;
    RETURN delivery_status;
END $$
DELIMITER ;

SELECT o.OrderID, o.StaffID, b.BookingID, b.BookingDate, GetDeliveryDate(o.OrderID), GetDeliveryStatus(o.OrderID) 
FROM Orders AS o LEFT JOIN Bookings AS b ON o.BookingID = b.BookingID;

INSERT INTO Deliveries(DeliveryID, DeliveryDate, Status)
SELECT OrderID, GetDeliveryDate(OrderID), GetDeliveryStatus(OrderID)
FROM Orders;

UPDATE Orders AS o
SET o.DeliveryID = (SELECT d.DeliveryID FROM Deliveries d WHERE o.OrderID = d.DeliveryID);

/* ****************************** END OF "POPULATE TABLES" ************************* */

/* ****************************** CREATE VIEWS AND PROCEDURES ************************* */

DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;


DROP PROCEDURE IF EXISTS GetMaxQuantity;
DELIMITER $$
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) AS 'Max Quantity in Order'
    FROM Orders;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER $$
CREATE PROCEDURE CancelOrder(order_id INT)
BEGIN
	DELETE FROM Orders WHERE OrderID = order_id;
    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER $$
CREATE PROCEDURE CancelOrder(order_id INT)
BEGIN
	DELETE FROM Orders WHERE OrderID = order_id;
    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END $$
DELIMITER ;


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
			WHEN number_of_bookings > 0 THEN CONCAT('Table ', table_no, ' is already booked on ', booking_date)
            ELSE CONCAT('Table ', table_no, ' is available on ', booking_date)
		END AS 'Booking Status';
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER $$
CREATE PROCEDURE AddValidBooking(booking_date DATE, table_no INT)
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
        SELECT CONCAT('Table ', table_no, ' is already booked on ', booking_date, ' - booking cancelled') AS 'Booking Status';
    ELSE 
		COMMIT;
		SELECT CONCAT('Table ', table_no, ' has been booked for ', booking_date) AS 'Booking Status';
	END IF;
END $$
DELIMITER ;

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

/* ****************************** END OF "CREATE VIEWS AND PROCEDURES" ************************* */














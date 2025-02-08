use littlelemondb;
-- select * from Menus;
/*
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
DELETE FROM MenuItems;
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

SELECT MenuID, GetMenuPrice(MenuID) FROM Menus;
SELECT * FROM Menus;
SELECT * FROM MenuItems;
SELECT SUM(i.Price)
FROM MenuItems AS mi LEFT JOIN Items AS i ON mi.ItemID = i.ItemID
WHERE mi.MenuID = 1;

SELECT *
FROM MenuItems AS mi LEFT JOIN Items AS i ON mi.ItemID = i.ItemID;
SELECT * FROM Menus;


UPDATE  Menus
SET TotalPrice = GetMenuPrice(MenuID) WHERE MenuID < 8;
SELECT * FROM Menus;


UPDATE Orders
SET TotalCost = GetMenuPrice(MenuID) * Quantity WHERE MenuID < 8;


SELECT o.OrderID, o.StaffID, b.BookingID, b.BookingDate 
FROM Orders AS o LEFT JOIN Bookings AS b ON o.BookingID = b.BookingID;

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

SELECT o.OrderID, o.StaffID, b.BookingID, b.BookingDate, GetDeliveryDate(o.OrderID), GetDeliveryStatus(o.OrderID) 
FROM Orders AS o LEFT JOIN Bookings AS b ON o.BookingID = b.BookingID;

INSERT INTO Deliveries(DeliveryDate, Status)
SELECT GetDeliveryDate(OrderID), GetDeliveryStatus(OrderID)
FROM Orders;
UPDATE Orders AS o
SET o.DeliveryID = (SELECT d.DeliveryID FROM Deliveries d WHERE o.OrderID = d.DeliveryID);
SELECT * FROM Orders;
select * from items;

SELECT c.CustomerID, CONCAT(c.FirstName, " ", c.LastName) AS FullName, o.OrderID, o.TotalCost, m.MenuName, m.Course
FROM Orders AS o 
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID
INNER JOIN Menus AS m ON o.MenuID = m.MenuID
WHERE o.TotalCost > 50
ORDER BY o.TotalCost ASC;

*/
SELECT c.CustomerID, CONCAT(c.FirstName, " ", c.LastName) AS FullName, o.OrderID, o.TotalCost, m.MenuName, m.Course
FROM Orders AS o 
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID
INNER JOIN Menus AS m ON o.MenuID = m.MenuID
WHERE o.TotalCost > 50
ORDER BY o.TotalCost ASC;

-- @ by Thai Giang Dang, 08/02/2025, Christchurch New Zealand

USE littlelemondb;
/**/
INSERT INTO Staff(StaffID, FirstName, LastName, Role, Address, Phone, Email, Salary) VALUES
(1, 'Mario', 'Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL',351258074,'Mario.g@littlelemon.com',70000),
(2, 'Adrian', 'Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL',351474048,'Adrian.g@littlelemon.com', 65000),
(3, 'Giorgos', 'Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL',351970582,'Giorgos.d@littlelemon.com', 50000),
(4, 'Fatma', 'Kaya','Assistant Chef','132  Bay Lane, Chicago, IL',351963569,'Fatma.k@littlelemon.com', 45000),
(5, 'Elena', 'Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL',351074198,'Elena.s@littlelemon.com', 40000),
(6, 'John', 'Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL',351584508,'John.m@littlelemon.com', 35000);

INSERT INTO Items (ItemName, Type, Price)
VALUES
-- italian
-- 'Classic Italian'
('Bruschetta', 'Starter', 6),
('Spaghetti Carbonara', 'Course', 18),
('Tiramisu', 'Dessert', 6),
-- 'Northern  Italian'
('Prosciutto e Melone', 'Starter', 6),
('Risotto alla Milanese', 'Course', 15),
('Panna Cotta', 'Dessert', 7),
-- 'Classic Greek'
('Tzatziki', 'Starter', 5),
('Moussaka', 'Course', 12),
('Galaktobroureko', 'Dessert', 6),
-- 'Seafood-Inspired'
('Grilled Octopus', 'Starter', 15),
('Psari Plaki', 'Course', 18),
('Loukoumades', 'Dessert', 6),
-- Turkish
-- 'Classic Turkish'
('Mercimek Corbasi', 'Starter', 4),
('Kebap', 'Course', 12),
('Baklava', 'Dessert', 5),
-- 'Ottoman-Inspired'
('Yaprak Sarma', 'Starter', 6),
('Hunkar Begendi ', 'Course', 15),
('Kunefe', 'Dessert', 7),

('Olives','Starter',5),
('Flatbread','Starter', 5),
('Minestrone', 'Starter', 8), -- Italian Soup
('Tomato bread','Starter', 8),
('Falafel', 'Starter', 7), -- Egyptian/Middle East broad beans chickpeas
('Hummus', 'Starter', 5), -- Middle Eat chickpeas
('Greek salad', 'Course', 15),
('Bean soup', 'Course', 12),
('Pizza', 'Course', 15),
('Greek yoghurt','Dessert', 7),
('Ice cream', 'Dessert', 6),
('Cheesecake', 'Dessert', 4),
('Athens White wine', 'Drink', 25),
('Corfu Red Wine', 'Drink', 30), -- Greek
('Turkish Coffee', 'Drink', 10),
('Turkish Coffee', 'Drink', 10),
('Kabasa', 'Course', 17),
-- greek
('Lemon bougatsa', 'Dessert', 10),
('Loukomadies', 'Dessert', 8); 
 

INSERT INTO Menus (MenuName, Cuisine, Starter, Course, Dessert)
VALUES
('Classic Italian', 'Italian', 'Bruschetta', 'Spaghetti Carbonara', 'Tiramisu'),
('Northern  Italian',  'Italian',  'Prosciutto e Melone', 'Risotto alla Milanese', 'Panna Cotta'),
('Classic Greek', 'Greek', 'Tzatziki', 'Moussaka', 'Galaktobroureko'),
('Seafood-Inspired',  'Greek',  'Grilled Octopus', 'Psari Plaki', 'Loukoumades'),
('Mercimek Corbasi', 'Turkish', 'Mercimek Corbasi', 'Kebap', 'Baklava'),
('Northern  Italian',  'Turkish',  'Yaprak Sarma', 'Hunkar Begendi', 'Kunefe'),
('Lunch Special', 'Mixed', 'Flatbread', 'Bean soup', 'Ice cream');
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



INSERT INTO Bookings (BookingDate, BookingTime, TableNo)
VALUES
('2025-02-01', '18:50:00', 12),
('2025-02-07', '12:30:00', 10),
('2025-02-08', '19:10:00', 12),
('2025-02-12', '20:00:00', 1),
('2025-02-13', '11:30:00', 2),
('2025-02-14', '12:00:00', 5),
('2025-02-14', '19:10:00', 10),
('2025-02-14', '20:20:00', 6);

INSERT INTO Customers(FirstName, LastName, Email, Phone)
VALUES
('Anna','Iversen','anna.iversen@gmail.com',351259642),
('Joakim', 'Iversen', 'j.iversen@yahoo.com', 352253781),
('Vanessa', 'McCarthy', 'vanessa.m@globalsuperstore.com', 361255597),
('Marcos', 'Romero', 'marcos.romero2208@mangatagallo.us', 451252112),
('Hiroki', 'Yamane', 'hyamane.smile@mitsubishi.com', 359439642),
('Diana', 'Pinto', 'diana.pinto@finance.org.us', 751100242);

INSERT INTO Orders (Quantity, BookingID, CustomerID, MenuID, StaffID)
VALUES
(1, 1, 1, 2, 1),
(2, 2, 2, 7, 5),
(1, 3, 6, 4, 2),
(1, 4, 3, 6, 6),
(3, 5, 2, 7, 6),
(2, 8, 5, 1, 6),
(4, 7, 4, 3, 6);

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

SELECT o.OrderID, o.StaffID, b.BookingID, b.BookingDate, GetDeliveryDate(o.OrderID), GetDeliveryStatus(o.OrderID) 
FROM Orders AS o LEFT JOIN Bookings AS b ON o.BookingID = b.BookingID;

INSERT INTO Deliveries(DeliveryDate, Status)
SELECT GetDeliveryDate(OrderID), GetDeliveryStatus(OrderID)
FROM Orders;

UPDATE Orders AS o
SET o.DeliveryID = (SELECT d.DeliveryID FROM Deliveries d WHERE o.OrderID = d.DeliveryID);
/**/












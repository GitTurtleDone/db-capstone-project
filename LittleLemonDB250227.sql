CREATE DATABASE  IF NOT EXISTS `littlelemondb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `littlelemondb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTime` time DEFAULT NULL,
  `TableNo` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2022-10-10','12:50:00',5,1),(2,'2022-11-12','17:30:00',3,3),(3,'2022-10-11','18:10:00',2,2),(4,'2025-10-13','20:30:00',2,1),(5,'2025-02-01','18:50:00',12,1),(6,'2025-02-07','12:30:00',10,2),(7,'2025-02-08','19:10:00',12,6),(8,'2025-02-12','20:00:00',1,3),(9,'2025-02-13','11:30:00',2,2),(10,'2025-02-14','12:00:00',5,5),(11,'2025-02-14','19:10:00',10,4),(12,'2025-02-14','20:20:00',6,6),(13,'2025-02-28',NULL,6,NULL),(99,'2022-12-10',NULL,99,99);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Anna','Iversen','anna.iversen@gmail.com',351259642),(2,'Joakim','Iversen','j.iversen@yahoo.com',352253781),(3,'Vanessa','McCarthy','vanessa.m@globalsuperstore.com',361255597),(4,'Marcos','Romero','marcos.romero2208@mangatagallo.us',451252112),(5,'Hiroki','Yamane','hyamane.smile@mitsubishi.com',359439642),(6,'Diana','Pinto','diana.pinto@finance.org.us',751100242),(99,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `DeliveryID` int NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'2022-10-10','Order paid'),(2,NULL,'Order served'),(3,'2022-10-11','Order paid'),(4,NULL,'To be served'),(5,NULL,'To be served'),(6,NULL,'To be served'),(7,NULL,'To be served');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ItemID` int NOT NULL,
  `ItemName` varchar(30) NOT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Bruschetta','Starter',12),(2,'Spaghetti Carbonara','Course',36),(3,'Tiramisu','Dessert',12),(4,'Prosciutto e Melone','Starter',12),(5,'Risotto alla Milanese','Course',30),(6,'Panna Cotta','Dessert',14),(7,'Tzatziki','Starter',10),(8,'Moussaka','Course',24),(9,'Galaktobroureko','Dessert',12),(10,'Grilled Octopus','Starter',30),(11,'Psari Plaki','Course',36),(12,'Loukoumades','Dessert',12),(13,'Mercimek Corbasi','Starter',8),(14,'Kebap','Course',24),(15,'Baklava','Dessert',10),(16,'Yaprak Sarma','Starter',12),(17,'Hunkar Begendi ','Course',30),(18,'Kunefe','Dessert',14),(19,'Olives','Starter',10),(20,'Flatbread','Starter',10),(21,'Minestrone','Starter',16),(22,'Tomato bread','Starter',16),(23,'Falafel','Starter',14),(24,'Hummus','Starter',10),(25,'Greek salad','Course',30),(26,'Bean soup','Course',24),(27,'Pizza','Course',30),(28,'Greek yoghurt','Dessert',14),(29,'Ice cream','Dessert',12),(30,'Cheesecake','Dessert',8),(31,'Athens White wine','Drink',50),(32,'Corfu Red Wine','Drink',60),(33,'Turkish Coffee','Drink',20),(34,'Turkish Coffee','Drink',20),(35,'Kabasa','Course',14),(36,'Lemon bougatsa','Dessert',20),(37,'Loukomadies','Dessert',10);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemID` int NOT NULL,
  `MenuID` int DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`),
  KEY `menu_id_fk_idx` (`MenuID`),
  KEY `item_id_fk_idx` (`ItemID`),
  CONSTRAINT `item_id_fk` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk2` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9),(10,4,10),(11,4,11),(12,4,12),(13,5,13),(14,5,14),(15,5,15),(16,6,16),(17,6,17),(18,6,18),(19,7,20),(20,7,26),(21,7,29);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL,
  `MenuName` varchar(30) NOT NULL,
  `Cuisine` varchar(30) DEFAULT NULL,
  `Starter` varchar(30) DEFAULT NULL,
  `Course` varchar(30) DEFAULT NULL,
  `Dessert` varchar(30) DEFAULT NULL,
  `TotalPrice` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Classic Italian','Italian','Bruschetta','Spaghetti Carbonara','Tiramisu',60.00),(2,'Northern  Italian','Italian','Prosciutto e Melone','Risotto alla Milanese','Panna Cotta',56.00),(3,'Classic Greek','Greek','Tzatziki','Moussaka','Galaktobroureko',46.00),(4,'Seafood-Inspired','Greek','Grilled Octopus','Psari Plaki','Loukoumades',78.00),(5,'Mercimek Corbasi','Turkish','Mercimek Corbasi','Kebap','Baklava',42.00),(6,'Northern  Italian','Turkish','Yaprak Sarma','Hunkar Begendi','Kunefe',56.00),(7,'Lunch Special','Mixed','Flatbread','Bean soup','Ice cream',46.00);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalCost` decimal(10,0) DEFAULT NULL,
  `BookingID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `StaffID` int DEFAULT NULL,
  `DeliveryID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `booking_id_fk_idx` (`BookingID`),
  KEY `menu_id_fk_idx` (`MenuID`),
  KEY `staff_id_fk_idx` (`StaffID`),
  KEY `delivery_id_fk_idx` (`DeliveryID`),
  CONSTRAINT `booking_id_fk` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `delivery_id_fk` FOREIGN KEY (`DeliveryID`) REFERENCES `deliveries` (`DeliveryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,56,1,2,1,1),(2,2,92,2,7,5,2),(3,1,78,3,4,2,3),(4,5,280,4,6,6,4),(5,3,138,5,7,6,5),(6,2,120,8,1,6,6),(7,4,184,7,3,6,7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Salary` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Mario','Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL',351258074,'Mario.g@littlelemon.com',70000.00),(2,'Adrian','Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL',351474048,'Adrian.g@littlelemon.com',65000.00),(3,'Giorgos','Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL',351970582,'Giorgos.d@littlelemon.com',50000.00),(4,'Fatma','Kaya','Assistant Chef','132  Bay Lane, Chicago, IL',351963569,'Fatma.k@littlelemon.com',45000.00),(5,'Elena','Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL',351074198,'Elena.s@littlelemon.com',40000.00),(6,'John','Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL',351584508,'John.m@littlelemon.com',35000.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'littlelemondb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetDeliveryDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` FUNCTION `GetDeliveryDate`(order_id INT) RETURNS date
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetDeliveryStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` FUNCTION `GetDeliveryStatus`(order_id INT) RETURNS varchar(20) CHARSET utf8mb3
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetMenuPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` FUNCTION `GetMenuPrice`(menu_id INT) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN
	DECLARE menu_price DECIMAL(4,2);
    SELECT SUM(i.Price) INTO menu_price
    FROM MenuItems AS mi LEFT JOIN Items AS i ON mi.ItemID = i.ItemID
    WHERE mi.MenuID = menu_id;
    RETURN menu_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `AddBooking`(booking_id INT, customer_id INT, table_no INT, booking_date DATE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `AddValidBooking`(booking_date DATE, table_no INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `CancelBooking`(booking_id INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `CancelOrder`(order_id INT)
BEGIN
	DELETE FROM Orders WHERE OrderID = order_id;
    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `CheckBooking`(booking_date DATE, table_no int)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT MAX(Quantity) AS 'Max Quantity in Order'
    FROM Orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManageBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `ManageBooking`(booking_date DATE, table_no INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`giang`@`%` PROCEDURE `UpdateBooking`(booking_id INT, update_booking_date DATE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`giang`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 10:30:53

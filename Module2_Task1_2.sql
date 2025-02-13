USE littlelemondb;
SELECT bc.CustomerID,  bc.FullName, o.OrderID, o.TotalCost, m.MenuName, m.Course
FROM Orders AS o 
INNER JOIN 
	(SELECT b.BookingID, b.CustomerID, CONCAT(c.FirstName, " ", c.LastName) AS FullName FROM Bookings AS b INNER JOIN Customers AS c ON b.CustomerID = c.CustomerID) AS bc 
    ON o.BookingID = bc.BookingID
INNER JOIN Menus AS m ON o.MenuID = m.MenuID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;
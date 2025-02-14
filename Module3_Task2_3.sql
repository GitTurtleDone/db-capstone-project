USE littlelemondb;
SELECT CONCAT(bc.FirstName, ' ', bc.LastName) AS 'Customer Full Name', bc.Email, bc.Phone, o.TotalCost
FROM Orders AS o 
LEFT JOIN 
	(SELECT b.BookingID, c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
    FROM Bookings AS b
    LEFT JOIN Customers AS c 
    ON b.CustomerID = c.CustomerID) AS bc
ON o.BookingID = bc.BookingID
WHERE o.TotalCost > 60;
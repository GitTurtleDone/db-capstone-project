USE littlelemondb;
SELECT c.CustomerID, CONCAT(c.FirstName, " ", c.LastName) AS FullName, o.OrderID, o.TotalCost, m.MenuName, m.Course
FROM Orders AS o 
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID
INNER JOIN Menus AS m ON o.MenuID = m.MenuID
WHERE o.TotalCost > 50
ORDER BY o.TotalCost ASC;
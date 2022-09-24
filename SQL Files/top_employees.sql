-- Top Employees
SELECT o.EmployeeID, e.FirstName, COUNT(distinct o.orderid) AS total_orders, SUM(od.Quantity*od.UnitPrice) AS total_sales
FROM orders o
JOIN employees e
ON o.employeeID = e.EmployeeID
JOIN orderdetails od
ON o.OrderID = od.OrderID
GROUP BY EmployeeID
ORDER BY total_sales DESC
LIMIT 5
;
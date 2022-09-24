# Top 5 countries (order wise)
SELECT ShipCountry, COUNT(distinct o.OrderID) AS total_orders_from_country, SUM(UnitPrice*Quantity) AS total_revenue
FROM orders o
JOIN orderdetails od
ON o.OrderID = od.OrderID
GROUP BY ShipCountry
ORDER BY total_revenue DESC
LIMIT 5
;
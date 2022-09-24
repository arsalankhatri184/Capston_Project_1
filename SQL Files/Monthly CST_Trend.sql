SELECT Daily_Customers.Month, COUNT(customer_count) AS Monthly_CST_Trend
FROM (SELECT SUBSTR(OrderDate, 1, 7) AS Month, COUNT(DISTINCT c.CustomerID) AS customer_count
	  FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
      GROUP BY CAST(OrderDate AS Date)) Daily_Customers
GROUP BY Daily_Customers.Month
ORDER BY Daily_Customers.Month;
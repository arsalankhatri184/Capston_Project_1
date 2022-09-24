-- top 2 categories of each individual
SELECT *
FROM 
(SELECT *, RANK() OVER (PARTITION BY CompanyName ORDER BY Revenue_Earned DESC) AS Category_Ranking
 FROM (SELECT CompanyName, CategoryName, SUM(od.UnitPrice * od.Quantity) AS Revenue_Earned 
	   FROM customers cst JOIN orders o ON cst.CustomerID = o.CustomerID
		    JOIN orderdetails od ON o.OrderID = od.OrderID
		    JOIN products pro ON od.ProductID = pro.ProductID
		    JOIN categories ctg ON pro.CategoryID = ctg.CategoryID
	   GROUP BY CompanyName, CategoryName
	   ORDER BY CompanyName, Revenue_Earned DESC) All_Categories) All_Categories_Ranking
WHERE Category_Ranking <= 2;
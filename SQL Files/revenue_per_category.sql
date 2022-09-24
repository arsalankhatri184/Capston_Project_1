SELECT * FROM northwind.categories;
# total revenue per category
SELECT c.CategoryName, SUM(od.UnitPrice*od.Quantity) AS total_revenue_per_category
FROM categories c
JOIN products p
ON c.CategoryID = p.CategoryID
JOIN orderdetails od
ON p.ProductID = od.ProductID
GROUP BY CategoryName
ORDER BY total_revenue_per_category DESC
LIMIT 5;





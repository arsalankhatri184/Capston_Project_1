-- TOP 5 products in each category

(
SELECT CategoryName, productname, SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Beverages'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname, SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Condiments'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname, SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Confections'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname,  SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Dairy Products'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname,  SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Grains/Cereals'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname,  SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Meat/Poultry'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname,  SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Produce'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
UNION
(
SELECT CategoryName, productname, SUM(od.UnitPrice * od.Quantity) AS total_revenue
FROM categories cg
JOIN products p ON cg.CategoryID = p.CategoryID
JOIN orderdetails od ON p.productId = od.productID
WHERE CategoryName = 'Seafood'
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5
)
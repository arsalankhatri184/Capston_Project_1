-- number of customers at start of the year - at the end of the year

(SELECT  1996 as Year, (first_month - last_month) / first_month * 100 
FROM 
(
SELECT  customerid,  COUNT(distinct CustomerID) AS first_month
FROM orders 
WHERE orderdate LIKE '1996-07%'
ORDER BY orderdate ASC
) a
JOIN 
(SELECT customerid, COUNT(distinct CustomerID) AS last_month
FROM orders 
WHERE orderdate LIKE '1996-12%'
ORDER BY orderdate ASC
) b 
)
UNION
(
SELECT  1997 as Year, (first_month - last_month) / first_month * 100 
FROM 
(
SELECT  customerid,  COUNT(distinct CustomerID) AS first_month
FROM orders 
WHERE orderdate LIKE '1997-01%'
ORDER BY orderdate ASC
) a
JOIN 
(SELECT customerid, COUNT(distinct CustomerID) AS last_month
FROM orders 
WHERE orderdate LIKE '1997-12%'
ORDER BY orderdate ASC
) b
) 
UNION
(
SELECT  1998 as Year, (first_month - last_month) / first_month * 100 
FROM 
(
SELECT  customerid,  COUNT(distinct CustomerID) AS first_month
FROM orders 
WHERE orderdate LIKE '1998-01%'
ORDER BY orderdate ASC
) a
JOIN 
(SELECT customerid, COUNT(distinct CustomerID) AS last_month
FROM orders 
WHERE orderdate LIKE '1998-05%'
ORDER BY orderdate ASC
) b 
)
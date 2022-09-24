SELECT cg.CategoryName, od.OrderID, quantity
FROM categories cg
JOIN products p
ON cg.CategoryID = p.CategoryID
JOIN orderdetails od 
ON p.ProductID = od.productID
ORDER BY Quantity DESC

-- shows which customer has more orders in categories
SELECT c.contactname , o.orderid , od.productid, od.quantity, ca.categoryname, od.unitprice*od.quantity AS total_expenditure
FROM customers c
JOIN orders o
ON c.customerid = o.customerid
JOIN orderdetails od
ON o.orderid = od.orderid
JOIN products p 
ON od.productid = p.productid
JOIN categories ca
ON p.categoryid = ca.categoryid
GROUP BY c.contactname


-- how much the customer spends
SELECT orderid, customerid, orderdate, shippeddate , DATEDIFF(CURRENT_DATE(), CAST(orderdate as DATE))
FROM orders





SELECT c.contactname , o.orderid , od.productid, sum(od.quantity), ca.categoryname, MAX(od.unitprice*od.quantity) 
FROM customers c
JOIN orders o
ON c.customerid = o.customerid
JOIN orderdetails od
ON o.orderid = od.orderid
JOIN products p 
ON od.productid = p.productid
JOIN categories ca
ON p.categoryid = ca.categoryid
-- WHERE categoryname IN (SELECT MAX(od.unitprice*od.quantity) FROM orderdetails GROUP BY orderid ) 
GROUP BY contactname

SELECT c.contactname , o.orderid , od.productid, od.quantity, ca.categoryname, od.unitprice*od.quantity AS total_expenditure
FROM customers c
JOIN orders o
ON c.customerid = o.customerid
JOIN orderdetails od
ON o.orderid = od.orderid
JOIN products p 
ON od.productid = p.productid
JOIN categories ca
ON p.categoryid = ca.categoryid
GROUP BY contactname

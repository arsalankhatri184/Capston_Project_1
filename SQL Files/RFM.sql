# Frequency - total_orders, Recency - recent_order_date, Monetary - total_revenue
SELECT CompanyName, rfm_recency*100 + rfm_frequency*10 + rfm_monetary AS rfm_combined 
FROM 
    (
       SELECT CompanyName, 
			ntile(5) OVER (ORDER BY recent_order_date) AS rfm_recency,
			ntile(5) OVER (ORDER BY total_orders) AS rfm_frequency,
			ntile(5) OVER (ORDER BY total_revenue) AS rfm_monetary
		FROM (SELECT monetory.CompanyName, total_orders, total_revenue, recent_order_date
				FROM (SELECT CompanyName, total_orders, SUM(UnitPrice*Quantity) AS total_revenue
					  FROM (SELECT CompanyName, ProductName, od.UnitPrice, od.Quantity, COUNT(*) OVER (PARTITION BY CompanyName) AS total_orders
							FROM customers cs 
								JOIN orders o ON cs.CustomerID = o.CustomerID
								JOIN orderdetails od ON od.OrderID = o.OrderID
								JOIN products p ON p.ProductID = od.ProductID) frequency
					  GROUP BY CompanyName) monetory 
                      JOIN 
					  (SELECT CompanyName, MAX(CAST(OrderDate AS date)) AS recent_order_date
						FROM customers cs JOIN orders o ON cs.CustomerID = o.CustomerID
								JOIN orderdetails od ON od.OrderID = o.OrderID
								JOIN products p ON p.ProductID = od.ProductID
						GROUP BY CompanyName
						ORDER BY CompanyName, OrderDate DESC) recency ON recency.CompanyName = monetory.CompanyName
		GROUP BY monetory.CompanyName) recency_frequeny_monetory          
    ) qurantiles
ORDER BY (rfm_recency*100 + rfm_frequency*10 + rfm_monetary) DESC;





						

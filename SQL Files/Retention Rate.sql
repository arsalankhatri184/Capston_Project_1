SELECT ((total_cst_last_month - total_cst_during_period) / total_cst_first_month) * 100 AS Retention_Rate
FROM (SELECT COUNT(DISTINCT CustomerID) AS total_cst_last_month 
	  FROM orders
	  WHERE OrderDate LIKE '1998-05%') last_month, 
      
      (SELECT COUNT(DISTINCT CustomerID) AS total_cst_first_month
	   FROM orders
	   WHERE OrderDate LIKE '1996-07%') first_month, 
       
       (SELECT COUNT(DISTINCT CustomerID) AS total_cst_during_period 
		FROM orders) Whole_period


											

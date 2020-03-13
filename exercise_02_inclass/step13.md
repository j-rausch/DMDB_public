Consider the following query that retrieves the date (orderdate) of the first order made by customer with name (customername) 'Customer#000000001':

``
SELECT	orderdate
FROM	orders, customer
WHERE	orders.customerid = customer.customerid
		AND	customername = 'Customer#000000001'
ORDER	BY orderdate ASC
LIMIT 	1;
``{{execute}}



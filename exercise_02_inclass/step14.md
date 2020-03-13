Find the number of customers that have made at least one order where at least one part is supplied by the same nation as the customer.

``
SELECT	COUNT(DISTINCT customer.customerid)
FROM	customer, orders, orderline, supplier
WHERE	customer.customerid = orders.customerid
		AND orders.orderid = orderline.orderid
		AND supplier.supplierid = orderline.supplierid
		AND supplier.nationid = customer.nationid;
``{{execute}}



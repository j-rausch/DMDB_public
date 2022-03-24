[TPC-H]

Get order ids, names of customers and date labels for all orders placed in years 1995 and later.
For orders from years 1995-1997, the date labels should say '95-97'. For orders from year 1998 and later, the labels should say '98-XX'.

1.
``
SELECT orderid, customername, (
        CASE WHEN o.orderdate >= '01-01-1998' THEN '98-XX'
                    WHEN o.orderdate >= '01-01-1995' THEN '95-97'
        END)
        AS date_label
FROM Orders o, Customer c
WHERE o.customerid = c.customerid;
``{{execute}}

2.
``
SELECT orderid, customername, date_label from (
        SELECT orderid, customername, (
                CASE WHEN o.orderdate >= '01-01-1998' THEN '98-XX'
                            WHEN o.orderdate >= '01-01-1995' THEN '95-97'
                             ELSE 'NOTHING'
                END) AS date_label
        FROM Orders o, Customer c
        WHERE o.customerid = c.customerid) AS labeled
WHERE date_label != 'NOTHING';
``{{execute}}

3.
``
SELECT orderid, customername, (
        CASE WHEN o.orderdate >= '01-01-1995' THEN '95-97'
                    WHEN o.orderdate >= '01-01-1998' THEN '98-XX'
        END) AS date_label
FROM Orders o, Customer c
WHERE o.customerid = c.customerid AND o.orderdate >= '01-01-1995';
``{{execute}}

4.
``
SELECT orderid, customername, (
        CASE WHEN o.orderdate >= '01-01-1998' THEN '98-XX'
                    WHEN o.orderdate >= '01-01-1995' THEN '95-97'
        END) AS date_label
FROM Orders o, Customer c
WHERE o.customerid = c.customerid AND o.orderdate >= '01-01-1995';
``{{execute}}

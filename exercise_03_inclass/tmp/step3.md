TPC-H:

``\c tpch``{{execute}}


[TPC-H] Consider the following query:

``
SELECT  orderid
FROM      orderline
WHERE   olquantity > 10
GROUP   BY orderid
HAVING  MIN(oldiscount) > 0.09
``{{execute}}


Fill in the gaps in the skeleton query below to make it equivalent to the query above. 

``
SELECT ?????? orderid
FROM     orderline AS ol
WHERE	(
        SELECT ?????? io.oldiscount ??????
        FROM     orderline io
        WHERE  io.orderid = ?????? AND ?????? > 10
)
??????
``
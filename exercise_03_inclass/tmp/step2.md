TPC-H:

``\c tpch``{{execute}}


For the original query below, which other alternative queries are equivalent to it (ignoring attribute names)?

``
SELECT MAX(supplypartcost) AS mostexpensive FROM supplypart;
``{{execute}}

A)

``
SELECT	DISTINCT supplypartcost
FROM    supplypart
WHERE	supplypartcost >= ALL (
SELECT supplypartcost
FROM    supplypart
);
``{{execute}}


B)

``
SELECT supplypartcost spc
FROM     supplypart
ORDER   BY spc
LIMIT       1;
``{{execute}}


C)

``
WITH	innerexp AS (
SELECT partid, supplierid
FROM     supplypart
ORDER  BY supplypartcost DESC
LIMIT      1
)
SELECT	supplypartcost spc
FROM     supplypart sp
JOIN       innerexp ie ON ie.partid = sp.partid
        AND ie.supplierid = sp.supplierid;
``{{execute}}


D)

``
WITH	innerexp AS (
SELECT partid, supplierid
FROM     supplypart
ORDER   BY supplypartcost DESC
LIMIT       1
) 
SELECT     sp.supplypartcost spc
FROM         supplypart sp
LEFT JOIN innerexp ie ON ie.partid = sp.partid
            AND ie.supplierid = sp.supplierid;
``{{execute}}


E)

``
(SELECT supplypartcost spc
 FROM     supplypart
 ORDER   BY spc ASC)
INTERSECT
(SELECT supplypartcost spc
 FROM     supplypart
 ORDER   BY spc DESC
 LIMIT       1);
``{{execute}}


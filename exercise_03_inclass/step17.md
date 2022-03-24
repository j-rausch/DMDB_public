[TPC-H]

What can we say about each of the following queries?

Most important, *is there anything that distinquishes the two*?

Query 1:

``
SELECT p.partid, p.partname
FROM Part p
JOIN Supplypart sp ON sp.partid = p.partid
WHERE sp.supplierid = 6 OR sp.supplierid = 33;
``{{execute}}

Query 2:

``
(SELECT p.partid, p.partname
FROM Part p
JOIN Supplypart sp ON sp.partid = p.partid
WHERE sp.supplierid = 6)
UNION
(SELECT p.partid, p.partname
FROM Part p
JOIN Supplypart sp ON sp.partid = p.partid
WHERE sp.supplierid = 33)
``{{execute}}

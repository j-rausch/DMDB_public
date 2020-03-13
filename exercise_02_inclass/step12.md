How many parts are supplied by the supplier with suppliername = 'Supplier#000000001' but not supplied by the supplier with suppliername = 'Supplier#000000002'? Write the appropriate query.

A)

``
SELECT  COUNT(partid)
FROM    part
WHERE   partid IN
        (
          SELECT  partid
          FROM    supplypart, supplier
          WHERE   supplypart.supplierid = supplier.supplierid
          AND     suppliername = 'Supplier#000000001'
        )
        AND partid NOT IN
        (
          SELECT  partid
          FROM    supplypart, supplier
          WHERE   supplypart.supplierid = supplier.supplierid
          AND     suppliername = 'Supplier#000000002'
        );
``{{execute}}


B)

``
SELECT  COUNT(partid)
FROM
(
          SELECT  partid
          FROM    supplypart, supplier
          WHERE   supplypart.supplierid = supplier.supplierid
          AND     suppliername = 'Supplier#000000001'
    EXCEPT
          SELECT  partid
          FROM    supplypart, supplier
          WHERE   supplypart.supplierid = supplier.supplierid
          AND     suppliername = 'Supplier#000000002'
) supp_counts;
``{{execute}}


Those are two solutions for the exercise but there can be other solutions as well.



Or also:

``
SELECT count(partid)
FROM supplier s
JOIN supplypart sp ON sp.supplierid = s.supplierid
WHERE s.suppliername = 'Supplier#000000001'
AND sp.partid NOT IN
    (
    SELECT partid 
    FROM supplier s 
    JOIN supplypart sp ON sp.supplierid = s.supplierid 
    WHERE s.suppliername = 'Supplier#000000002'
    );
``{{execute}}



Query without exclusion of supplier 2:
``
SELECT  COUNT(partid)
FROM    part
WHERE   partid IN
        (
          SELECT  partid
          FROM    supplypart, supplier
          WHERE   supplypart.supplierid = supplier.supplierid
          AND     suppliername = 'Supplier#000000001'
        );
``{{execute}}


Check which suppliers are ALSO providing the same parts, in addiction to supplier#01:

``
SELECT  part.partid, suppliername
FROM    part
JOIN supplypart ON supplypart.partid = part.partid
JOIN supplier ON supplier.supplierid = supplypart.supplierid
WHERE   part.partid IN
        (
          SELECT  partid
          FROM    supplypart, supplier
          WHERE   supplypart.supplierid = supplier.supplierid
          AND     suppliername = 'Supplier#000000001'
        )
ORDER BY suppliername ASC
``{{execute}}

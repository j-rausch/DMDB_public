
Explore Dataset:

``
SELECT *	
FROM region;
``{{execute}}


``
SELECT *	
FROM nation;
``{{execute}}


``
SELECT *	
FROM	nation, region
``{{execute}}


Given the following query that tries to list all nations in the regions of 'AMERICA', 'AFRICA' or 'ASIA'.

A)

``
SELECT	nationname
FROM	nation, region
WHERE   regionname = 'AMERICA'
OR regionname = 'AFRICA'
OR regionname = 'ASIA';
``{{execute}}


B)

``
SELECT	nationname
FROM	nation, region
WHERE   regionname = 'AMERICA'
AND regionname = 'AFRICA'
AND regionname = 'ASIA';
``{{execute}}


C)

``
SELECT	nationname
FROM	nation, region
WHERE   nation.regionid = region.regionid
AND (
     regionname = 'AMERICA'
     OR regionname = 'AFRICA'
     OR regionname = 'ASIA'
);
``{{execute}}


D)

``
SELECT	nationname
FROM	nation, region
WHERE   nation.regionid = region.regionid
AND (
     regionname = 'AMERICA'
     AND regionname = 'AFRICA'
     AND regionname = 'ASIA'
);
``{{execute}}




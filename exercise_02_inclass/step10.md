The following queries refer to the TPC-H database:

``\c tpch``{{execute}}


Write a query which returns how many customers come from 'JAPAN' (nationname).


``
SELECT	COUNT(*)
FROM	customer, nation
WHERE	customer.nationid = nation.nationid
		AND nationname = 'JAPAN';
``{{execute}}



Which query or queries return the correct count of employees in the database whose first name starts with the letter B?

A)

``
SELECT	count(first_name)
FROM	employees
WHERE	first_name LIKE 'B'
		OR first_name LIKE 'b';
``{{execute}}


B)

``
SELECT	count(first_name)
FROM	employees
WHERE	substring(first_name,0,1) in ('B');
``{{execute}}


C)

``
SELECT	count(first_name)
FROM	employees
WHERE	first_name LIKE 'B%';
``{{execute}}


D)

``
SELECT	count(first_name) 
FROM	employees 
WHERE	substring(first_name,1,1) = 'B';
``{{execute}}


Test some queries:


``
SELECT	first_name, substring(first_name,0,1) as substr
FROM	employees ;
``{{execute}}


``
SELECT	first_name, substring(first_name,1,2) as substr
FROM	employees ;
``{{execute}}

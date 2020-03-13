Write a query that returns a list of the 10 first employees (first name (first\_name) and last name (last\_name)) which the company hired (hire\_date). The list should be sorted in alphabetical order of the employees’ last names.


``
SELECT	*
FROM	(
			SELECT	e.first_name, e.last_name
			FROM	employees e
			ORDER	BY e.hire_date, e.last_name ASC
			LIMIT	10
		) AS res
ORDER	BY last_name ASC;
``{{execute}}


Subquery:


``
SELECT	e._hire_date, e.first_name, e.last_name
FROM	employees e
ORDER	BY e.hire_date, e.last_name;
``{{execute}}


``
SELECT	e._hire_date, e.first_name, e.last_name
FROM	employees e
ORDER	BY e.hire_date, e.last_name
LIMIT 10;
``{{execute}}


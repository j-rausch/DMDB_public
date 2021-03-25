[Employees] Write a SQL query that finds the highest 3 salaries currently paid in each department. Include the rank (1st, 2nd and 3rd highest) as an extra column in the result.

Hint 1: Try breaking the problem up into subproblems. Maybe you have already solved one of them.

Hint 2: SELECT DISTINCT returns a set in which each identical record appears only once. 

Hint 3: It is possible to include a SELECT statement in the column list of an other query. For example:

``
SELECT	name, (
SELECT MAX(price)
FROM    purchases p
WHERE  p.paid_by=name
) AS most_expensive_purchase 
FROM	persons
WHERE	name = 'Jonas'
``{{execute}}

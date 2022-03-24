[Employee2]

Part 1.

Given the following three queries, decide which one(s) correctly return(s) the number of employees who received a salary in December of 1996. 
To receive money in a month a person has to work at least one day in that month.

1. 
``
SELECT COUNT(*)
FROM salaries
WHERE to_date >= '1996-12-01';
``{{execute}}

2. 
``
SELECT COUNT(*)
FROM salaries
WHERE from_date <= '1996-12-31' AND to_date >= '1996-12-01';
``{{execute}}

3. 
``
SELECT COUNT(*)
FROM   salaries
WHERE  from_date <= '1996-12-31' 
  AND (to_date >= '1996-12-01' OR to_date IS NULL) ;
``{{execute}}


[Employees] How many people earn more than the 3rd highest current salary in “Marketing” and also more than the 2nd highest salary in “Finance”? Write the query using the view.


``
SELECT	COUNT(*)
FROM     top_salaries t1
JOIN       departments d1 USING(dept_no), top_salaries t2
JOIN       departments d2 USING(dept_no), current_employees e
WHERE  d1.dept_name = 'Marketing'
               AND t1.rank = 3
               AND d2.dept_name = 'Finance'
               AND t2.rank = 2
               AND e.salary > t1.salary
               AND e.salary > t2.salary
``{{execute}}
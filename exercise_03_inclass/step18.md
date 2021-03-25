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



-- Option 1 -- Compute rank manually -- Using JOIN

``
WITH current_dept_emp AS (
SELECT	*
FROM    dept_emp
WHERE	NOW() BETWEEN from_date AND to_date
),
current_employees_ranked_by_dept AS (
SELECT	e1.emp_no AS emp_no, e1.salary AS salary, de1.dept_no AS dept_no, COUNT(e2.emp_no) AS rank
FROM    current_employees e1 -- use view from previous exercise
JOIN      current_employees e2 ON e1.salary <= e2.salary
JOIN      current_dept_emp de1 ON e1.emp_no = de1.emp_no
JOIN      current_dept_emp de2 ON e2.emp_no = de2.emp_no
              AND de2.dept_no = de1.dept_no
GROUP	BY e1.emp_no, e1.salary, de1.dept_no
ORDER	BY dept_no, rank
)
SELECT	*
FROM     current_employees_ranked_by_dept
WHERE  rank <= 3
``{{execute}}


-- Using subqueries

``
SELECT	*
FROM    (
SELECT emp_no, salary, dept_no, (
SELECT COUNT(*)
FROM     current_employees ins1
JOIN       dept_emp ide USING(emp_no)
WHERE  ide.dept_no = de.dept_no
               AND ide.to_date > NOW()
               AND ins1.salary >= s.salary
) AS rank
FROM	dept_emp de
JOIN	current_employees s USING(emp_no)
WHERE de.to_date > NOW()
) AS ranked
WHERE	rank <= 3
ORDER BY	dept_no, salary DESC
``{{execute}}


--Option 2 -- Use rank function

``
WITH current_employees_ranked_by_dept AS (
SELECT	*, RANK() OVER (
PARTITION BY de.dept_no
ORDER       BY salary DESC
) AS rank
FROM    current_employees ce   -- use view from previous exercise
JOIN      dept_emp de ON de.emp_no = ce.emp_no
JOIN      departments d ON d.dept_no = de.dept_no
WHERE	NOW() BETWEEN de.from_date AND de.to_date
)
SELECT	*
FROM    current_employees_ranked_by_dept
WHERE	rank <= 3
``{{execute}}

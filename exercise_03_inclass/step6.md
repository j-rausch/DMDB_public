[Employees] Use the view from the previous task to determine the employees (give their full names) earning between the 45th and 55th percentile of the current salary distribution in the company


-- Option 1 -- with the rank function
``
WITH	ranked_current_employees AS (
SELECT	*, PERCENT_RANK()
OVER     (ORDER BY salary) AS rank
FROM     current_employees
)
SELECT	e.first_name, e.last_name, salary
FROM     ranked_current_employees ce
JOIN       employees e ON e.emp_no = ce.emp_no
WHERE  rank BETWEEN 0.45 AND 0.55
``{{execute}}


-- Option 2 -- compute rank manually
``
WITH absolute_ranked_employees AS (
SELECT	e1.emp_no AS emp_no, e1.salary AS salary, COUNT(e2.emp_no) AS absolute_rank
FROM     current_employees e1
JOIN       current_employees e2 ON e1.salary <= e2.salary
GROUP  BY e1.emp_no, e1.salary
),
       ranked_employees AS (
SELECT *, (absolute_rank-1)::FLOAT / (SELECT COUNT(*)-1 FROM	current_employees) AS rank
FROM    absolute_ranked_employees
ORDER  BY salary DESC
)
SELECT	* FROM	ranked_employees
WHERE  rank BETWEEN 0.45 AND 0.55
``{{execute}}




-- Option 3 -- using a window function
``
SELECT	first_name, last_name, salary
FROM     current_employees ce
JOIN       employees em USING(emp_no)
WHERE  salary BETWEEN (
SELECT	PERCENTILE_DISC(0.45)
WITHIN  GROUP (ORDER BY salary)
FROM    current_employees ce
) AND (
SELECT	PERCENTILE_DISC(0.55)
WITHIN  GROUP (ORDER BY salary)
FROM     current_employees ce
)
ORDER  BY salary 
``{{execute}}


Moreover, there are other window functions that can be used for determining border salaries, and even though it was not covered during the exercise session, we can also use PERCENTILE_CONT instead of the PERCENTILE_DISC to get interpolated value instead of the already existing discrete value from the salaries set. In that case, we might get different number of rows in the result set.
 

-- Option 4a -- use order and limit (wrong)
``
SELECT	e.first_name, e.last_name, salary
FROM    employees e
JOIN      (
SELECT	*
FROM    current_employees ce
ORDER  BY ce.salary ASC
LIMIT      0.55 * (
SELECT	COUNT(*)
FROM     current_employees
)
) ce_lim ON ce_lim.emp_no = e.emp_no
ORDER	BY ce_lim.salary DESC
LIMIT     0.1 * (
SELECT COUNT(*)
FROM    current_employees
)
``{{execute}}

-- While this option looks good, it does not compute the correct result in case several employees have the 45-percentile salary. In that case, the query returns some of them but does not return the others. That does not correspond to what it is supposed to return. However, we can use a similar idea as shown below.


-- Option 4b -- use order and limit (fixed)
``
WITH interesting_salary_range AS (
SELECT	salary
FROM    (
SELECT	*
FROM    current_employees ce
ORDER  BY ce.salary ASC
LIMIT      0.55 * (
SELECT COUNT(*)
FROM     current_employees
)
) AS lowest55
ORDER  BY salary DESC
LIMIT      0.1 * (
SELECT COUNT(*)
FROM     current_employees
) 
)
SELECT	first_name, last_name, salary
FROM    current_employees ce
JOIN      employees em ON em.emp_no = ce.emp_no
WHERE	salary >= (
SELECT *
FROM    interesting_salary_range
ORDER  BY salary ASC
LIMIT      1
)
       AND salary < (
SELECT	*
FROM    interesting_salary_range
ORDER  BY salary DESC
LIMIT      1
)
ORDER  BY salary
``{{execute}}

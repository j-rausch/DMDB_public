[Employee]

We want to write a query to find all employees who have worked in more than one department (include any department they are currently working at).

``
SELECT e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
GROUP BY e.emp_no
HAVING COUNT(DISTINCT dept_no) > 1;
``{{execute}}



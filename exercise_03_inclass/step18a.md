[Employee]

Part 1.

Describe the functionality of the following query.

``
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
WHERE e.emp_no IN (
            SELECT dm.emp_no
            FROM dept_manager dm JOIN salaries s ON dm.emp_no = s.emp_no
            WHERE dm.to_date > NOW() AND s.to_date > NOW()
            ORDER BY s.salary DESC
            LIMIT 5);
``{{execute}}

> *The query returns employee numbers, first and last names of the top 5 currently most earning managers*

Now let's rewrite it without using the `IN` functionality.

``
SELECT DISTINCT e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN dept_manager dm ON e.emp_no=dm.emp_no
JOIN salaries s ON dm.emp_no=s.emp_no
WHERE dm.to_date>NOW() AND s.to_date>NOW()
ORDER BY salary DESC
LIMIT 5;
``{{execute}}



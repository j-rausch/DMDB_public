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

Now let's rewrite it without using the `IN` functionality.

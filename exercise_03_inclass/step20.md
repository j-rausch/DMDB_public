[Employee]

Part 3.

Describe the functionality of the following query.

``
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
WHERE e.emp_no NOT IN (
            SELECT dm.emp_no
            FROM dept_manager dm
            WHERE dm.to_date > NOW())
``{{execute}}

Now let's rewrite it without using the `NOT IN` functionality.

[Employee]

Part 2.

Describe the functionality of the following query.

``
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE de.to_date > NOW() AND s.to_date > NOW()
        AND s.salary > (
            SELECT s1.salary
            FROM dept_manager dm
            JOIN salaries s1 ON s1.emp_no = dm.emp_no
            WHERE dm.dept_no = de.dept_no
                    AND dm.to_date > NOW()
                    AND s1.to_date > NOW());
``{{execute}}

Now let's rewrite it without using the nested subexpression.


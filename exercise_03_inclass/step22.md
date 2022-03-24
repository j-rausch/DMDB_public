[Employee]

We want to write a query to find all employees who have worked in more than one department (include any department they are currently working at).

``
SELECT d.dept_name
FROM dept_emp de
JOIN salaries s ON de.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE s.to_date > NOW() AND de.to_date > NOW()
GROUP BY d.dept_name
HAVING AVG(s.salary) - 5000 >= (
              SELECT AVG(s1.salary)
              FROM dept_emp de1
              JOIN salaries s1 ON de1.emp_no = s1.emp_no
              JOIN departments d1 ON d1.dept_no = de1.dept_no
              WHERE d1.dept_name = d.dept_name
                      AND EXTRACT(YEAR FROM s1.to_date) >= 2000
                      AND EXTRACT(YEAR FROM s1.from_date) <= 2000
                      AND EXTRACT(YEAR FROM de1.to_date) >= 2000
                      AND EXTRACT(YEAR FROM de1.from_date) <= 2000
                      AND s1.to_date >= de1.from_date
                      AND de1.to_date >= s1.from_date );
``{{execute}}

There are *many* alternative ways one could write such a query. For example, 

``
SELECT d.dept_name
FROM dept_emp de
JOIN salaries s ON de.emp_no = s.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN dept_emp de2000 ON de2000.dept_no = de.dept_no
JOIN salaries s2000 ON s2000.emp_no = de2000.emp_no
WHERE s.to_date > NOW()
        AND de.to_date > NOW()
        AND EXTRACT(YEAR FROM s2000.to_date) >= 2000
        AND EXTRACT(YEAR FROM s2000.from_date) <= 2000
        AND EXTRACT(YEAR FROM de2000.to_date) >= 2000
        AND EXTRACT(YEAR FROM de2000.from_date) <= 2000
        AND s2000.to_date >= de2000.from_date
        AND de2000.to_date >= s2000.from_date
GROUP BY d.dept_name
HAVING AVG(s.salary) >= AVG(s2000.salary) + 5000;
``{{execute}}



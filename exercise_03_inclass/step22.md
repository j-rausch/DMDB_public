[Employee]

We want to write a query to find all employees who have worked in more than one department (include any department they are currently working at).

Below is a template with some blanks denoted by `[[]]` that you can use as a starting point.


``
[[]] d.dept_name
[[]] dept_emp de
[[]] salaries s ON de.emp_no = s.emp_no
[[]] departments d ON d.dept_no = de.dept_no
[[]] s.to_date > [[5]] AND de.to_date > [[5]]
GROUP BY d.dept_name
HAVING [[6]](s.salary) - 5000 >= (
              SELECT AVG(s1.salary)
              FROM dept_emp de1
              JOIN salaries s1 ON de1.emp_no = s1.emp_no
              JOIN departments d1 ON d1.dept_no = de1.dept_no
              WHERE d1.dept_name = d.dept_name
                      AND [[]] FROM s1.to_date) >= 2000
                      AND [[]] FROM s1.from_date) <= 2000
                      AND [[]] FROM de1.to_date) >= 2000
                      AND [[]] FROM de1.from_date) <= 2000
                      AND s1.to_date >= de1.from_date
                      AND de1.to_date >= s1.from_date );
``

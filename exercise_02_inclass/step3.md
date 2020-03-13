Consider the following query. Select the statement which describes what the query is meant to do.

``
SELECT  e.first_name, e.last_name, d.dept_name, s.salary, avgst.avgs
FROM    employees e
JOIN    salaries s ON s.emp_no = e.emp_no
JOIN    dept_manager dm ON dm.emp_no = e.emp_no
JOIN    departments d ON d.dept_no = dm.dept_no
JOIN    (
            SELECT  de.dept_no, AVG(s.salary) AS avgs
            FROM    employees e
            JOIN    salaries s ON e.emp_no = s.emp_no
            JOIN    dept_emp de ON de.emp_no = s.emp_no
            WHERE   s.to_date > NOW()
                    AND de.to_date > NOW()
            GROUP   BY de.dept_no
        ) avgst ON avgst.dept_no = dm.dept_no
WHERE   dm.to_date > NOW()
        AND s.to_date > NOW()
        AND s.salary > avgst.avgs;
``{{execute}}



Sub-query to get avg salary per department:

``
SELECT  de.dept_no, AVG(s.salary) AS avgs
FROM    employees e
JOIN    salaries s ON e.emp_no = s.emp_no
JOIN    dept_emp de ON de.emp_no = s.emp_no
WHERE   s.to_date > NOW()
        AND de.to_date > NOW()
GROUP   BY de.dept_no;
``{{execute}}

Without selection:

``
SELECT  de.dept_no, e.emp_no as empoloyee_nr, s.salary, s.to_date as salary_todate, de.to_date as emp_todate
FROM    employees e
JOIN    salaries s ON e.emp_no = s.emp_no
JOIN    dept_emp de ON de.emp_no = s.emp_no;
``{{execute}}



consider also this query to exclude the manager's salary:


``
SELECT  e.first_name, e.last_name, d.dept_name, s.salary, avgst.avgs
FROM    employees e
JOIN    salaries s ON s.emp_no = e.emp_no
JOIN    dept_manager dm ON dm.emp_no = e.emp_no
JOIN    departments d ON d.dept_no = dm.dept_no
JOIN    (
            SELECT  de.dept_no, AVG(s.salary) AS avgs
            FROM    employees e
            JOIN    salaries s ON e.emp_no = s.emp_no
            JOIN    dept_emp de ON de.emp_no = s.emp_no
            WHERE   s.to_date > NOW()
                    AND de.to_date > NOW()
                    AND e.emp_no NOT IN (SELECT dm.emp_no FROM dept_manager as dm)
            GROUP   BY de.dept_no
        ) avgst ON avgst.dept_no = dm.dept_no
WHERE   dm.to_date > NOW()
        AND s.to_date > NOW()
        AND s.salary > avgst.avgs;
``{{execute}}

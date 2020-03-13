Write a query that determines for each department the average salary of anyone starting or receiving a salary change in 1988 from that department. It should display the department number, its name and its average.


``
SELECT	dp.dept_no AS deptnumber, dp.dept_name AS deptname,
		avg(salary) AS avg_salary
FROM	salaries s, dept_emp de, departments dp
WHERE	de.emp_no = s.emp_no
		AND dp.dept_no = de.dept_no
		AND date_part('year', s.from_date) = 1988
GROUP 	BY dp.dept_no;
``{{execute}}


other option:


``
SELECT d.dept_no AS deptnumber, d.dept_name as deptname, AVG(s.salary) as avg_salary
FROM departments d
JOIN dept_emp de ON de.dept_no = d.dept_no
JOIN salaries s ON s.emp_no = de.emp_no
WHERE EXTRACT (YEAR from s.from_date) = 1988
GROUP BY d.dept_no ;
``{{execute}}

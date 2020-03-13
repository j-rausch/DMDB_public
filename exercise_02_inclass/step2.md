Employees:

``\c employee``{{execute}}



Explore


``
SELECT *	
FROM	employees e;
``{{execute}}


``
SELECT *	
FROM	employees e
JOIN dept_emp de ON de.emp_no = e.emp_no;
``{{execute}}


The following three queries try to compute the average salary of all current employees per department and to display department names and salary averages in descending order of the average salary. Mark the correct solution:

A)

``
SELECT	d.dept_name, AVG(s.salary) AS avgs
FROM	employees e
JOIN	salaries s ON e.emp_no = s.emp_no
JOIN	dept_emp de ON de.emp_no = s.emp_no
JOIN	departments d ON d.dept_no = de.dept_no
GROUP	BY d.dept_name
ORDER 	BY avgs DESC;
``{{execute}}

B)

``
SELECT	d.dept_name, AVG(s.salary) AS avgs
FROM	employees e
JOIN	salaries s ON e.emp_no = s.emp_no
JOIN	dept_emp de ON de.emp_no = s.emp_no
JOIN	departments d ON d.dept_no = de.dept_no
WHERE   s.to_date > NOW()
		AND de.to_date > NOW()
GROUP 	BY d.dept_name
ORDER 	BY avgs DESC;
``{{execute}}


C)

``
SELECT	e.dept_no, AVG(s.salary) AS avgs
FROM	employees e
JOIN	salaries s ON e.emp_no = s.emp_no
JOIN	dept_emp de ON de.emp_no = s.emp_no
WHERE	s.to_date > NOW()
		AND de.to_date > NOW()
ORDER 	BY avgs DESC;
``{{execute}}

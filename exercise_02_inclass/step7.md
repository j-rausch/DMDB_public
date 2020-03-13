Return the first (first\_name) and last name (last\_name) of all current managers, their title, their salary, and the department name (dept\_name) for which they are responsible.


``
SELECT	e.first_name, e.last_name, t.title, d.dept_name, s.salary
FROM	employees e
JOIN	dept_manager dm ON dm.emp_no = e.emp_no
JOIN	departments d ON dm.dept_no = d.dept_no
JOIN	titles t ON t.emp_no = e.emp_no
JOIN	salaries s ON s.emp_no = e.emp_no
WHERE   dm.to_date > NOW()
		AND t.to_date > NOW()
		AND s.to_date > NOW();
``{{execute}}



Without selecting only current salaries:


``
SELECT	e.first_name, e.last_name, t.title, d.dept_name, s.salary
FROM	employees e
JOIN	dept_manager dm ON dm.emp_no = e.emp_no
JOIN	departments d ON dm.dept_no = d.dept_no
JOIN	titles t ON t.emp_no = e.emp_no
JOIN	salaries s ON s.emp_no = e.emp_no
WHERE   dm.to_date > NOW()
		AND t.to_date > NOW();
``{{execute}}


Or current titles:


``
SELECT	e.first_name, e.last_name, t.title, d.dept_name, s.salary
FROM	employees e
JOIN	dept_manager dm ON dm.emp_no = e.emp_no
JOIN	departments d ON dm.dept_no = d.dept_no
JOIN	titles t ON t.emp_no = e.emp_no
JOIN	salaries s ON s.emp_no = e.emp_no
WHERE   dm.to_date > NOW()
		AND s.to_date > NOW();
``{{execute}}

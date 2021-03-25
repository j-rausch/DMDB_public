[Employees] The following four queries try to determine what was the average salary of employees working in each department in 1997 (the average is not weighted by employment length). Assume that the department names are unique. Mark the correct solution(s):

``
SELECT dp.dept_name, AVG(salary) AS average_salary
FROM	salaries s 
JOIN       dept_emp de USING(emp_no)
JOIN       departments dp USING(dept_no)
WHERE	de.from_date < s.to_date
		AND de.to_date > s.from_date 
		AND (
			s.from_date BETWEEN '1997-01-01' AND '1997-12-31'
			OR s.to_date BETWEEN '1997-01-01' AND '1998-01-01'
		) 
GROUP  BY dp.dept_name
``{{execute}}


``
SELECT	dp.dept_name, AVG(salary) AS average_salary 
FROM	salaries s
JOIN        dept_emp de USING(emp_no)
JOIN        departments dp USING(dept_no)
WHERE	de.from_date < s.to_date
		AND de.to_date > s.from_date
		AND s.from_date <= '1997-12-31'
		AND s.to_date > '1997-01-01'
GROUP	BY dp.dept_name
``{{execute}}


``
WITH emp_sal AS (
	SELECT	s.emp_no AS emp_no, s.salary AS salary, s.from_date AS started, s.to_date AS ended
	FROM	salaries s 
	WHERE	s.from_date <= '1997-12-31'
			AND s.to_date > '1997-01-01'
	) 
SELECT	dp.dept_name AS department, COUNT(emp_sal.salary) AS appears, emp_sal.emp_no
FROM	 emp_sal
JOIN        dept_emp de USING(emp_no)
JOIN        departments dp USING(dept_no)
WHERE	de.from_date < emp_sal.ended
		AND de.to_date > emp_sal.started
GROUP	BY dp.dept_name, emp_sal.emp_no
ORDER	BY appears DESC
``{{execute}}


``
WITH emp_sal AS (
SELECT emp_no, salary AS salary, from_date AS started
	FROM    salaries 
WHERE	from_date <= '1997-12-31' 
                AND to_date > '1997-01-01'
	)
SELECT	dp.dept_name AS department, AVG(emp_sal.salary) 
FROM	emp_sal
JOIN       dept_emp de USING(emp_no)
JOIN       departments dp USING(dept_no)
WHERE  de.from_date <= '1997-12-31'
		AND de.to_date > '1997-01-01'
GROUP	BY dp.dept_name
ORDER	BY department
``{{execute}}

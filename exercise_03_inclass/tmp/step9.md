[Employees] We want to find what was the ratio between the lowest and highest starting salaries (salaries matching the hire_date of employees) in the Marketing department over the course of the years. Output the ratio for each year in which there were people starting in the Marketing department.

Hint 1: you can perform GROUP BYs on any column or expression specified in the SELECT clause.

Hint 2: you may need to use explicit casting to compute a floating point value.

``
SELECT	MIN(salary::FLOAT)/MAX(salary) AS salary_mult, DATE_PART('year', s.from_date) AS salyear
FROM    salaries s
JOIN      dept_emp de USING(emp_no)
JOIN      departments dp USING(dept_no)
JOIN      employees emp USING(emp_no)
WHERE dp.dept_name = 'Marketing'
               AND emp.hire_date = s.from_date
               AND de.from_date = s.from_date
GROUP  BY DATE_PART('year', s.from_date)
ORDER  BY salyear
``{{execute}}
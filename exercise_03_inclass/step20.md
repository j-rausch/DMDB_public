[Employees] List the names of the people (from any department) who earn more at the moment than the 3rd highest current salary in the department “Marketing”.

Hint: create a view (CREATE VIEW topsalaries AS ...) with the solution to the previous exercise, and write a query against this view instead of the data.

``
WITH third_salary AS (
SELECT	salary
FROM    top_salaries
JOIN      departments USING(dept_no)
WHERE	rank = 3
              AND dept_name = 'Marketing'
)
SELECT	DISTINCT first_name, last_name
FROM    employees e
JOIN      current_employees s USING(emp_no), third_salary
WHERE	s.salary > third_salary.salary
``{{execute}}

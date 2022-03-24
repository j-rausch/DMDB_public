Given following query:

``
WITH subquery AS (
SELECT salary
FROM    top_salaries
JOIN      department USING(dept_no)
WHERE rank = 3
              AND dept_name = 'Marketing'
              )
SELECT DISTINCT first_name, last_name
FROM    employees e
JOIN      current_employees s USING(emp_no), subquery
WHERE s.salary > subquery.salary
``{{execute}}

The query lists the names of the people (from any department) who earn more at the moment than the 3rd highest current salary in the department “Marketing”.


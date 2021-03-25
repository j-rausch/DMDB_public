Employees:

``\c employee``{{execute}}


Whenever we refer to “current” or “present” in this exercise, we refer to the date returned by the built-in NOW() function. Additionally, take a look at DATE_PART() function provided by PostgreSQL [LINK](https://www.postgresql.org/docs/9.5/functions-datetime.html). It is useful if you want to extract the year, month, etc. of a date.

What is the current highest salary in each department if we only consider people people who have been hired at the company before 1990?


``
SELECT dp.dept_name AS department, MAX(salary) AS max_salary
FROM     salaries s
JOIN       dept_emp de USING(emp_no)
JOIN       departments dp USING(dept_no)
JOIN       employees emp USING(emp_no)
WHERE  de.to_date > NOW()
                AND s.to_date > NOW()
                AND DATE_PART('year', emp.hire_date) < 1990
GROUP   BY dp.dept_name
``{{execute}}

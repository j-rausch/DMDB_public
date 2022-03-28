Given following query:

``
WITH subquery AS (
SELECT salary
FROM    top_salaries
JOIN      departments USING(dept_no)
WHERE rank = 3
AND dept_name = 'Marketing'
)
SELECT DISTINCT first_name, last_name
FROM    employees e
JOIN      current_employees s USING(emp_no), subquery
WHERE s.salary > subquery.salary
``{{execute}}


Answer which of the following statements are true/false:

1. The subquery returns the third highest salary in the company.
    - False: The subquery returns the third highest salary in the marketing department.
2. The query returns the names of people in the marketing department with the top three highest salaries.
    - False: It returns names of people from all departments
3. A unique employee name may appear at most once in the query result.
    - True 

General:
The query lists the names of the people (from any department) who earn more at the moment than the 3rd highest current salary in the department “Marketing”.


Note: The query in this question relies on creating a view of the top salaries from the previous task.
This could be done as follows:

``
CREATE VIEW top_salaries AS (
 SELECT    de.emp_no, de.dept_no, from_date, to_date, salary, RANK() OVER (
 PARTITION BY de.dept_no
 ORDER       BY salary DESC
 ) AS rank
 FROM    current_employees ce   -- use view from previous exercise
 JOIN      dept_emp de ON de.emp_no = ce.emp_no
 JOIN      departments d ON d.dept_no = de.dept_no
 WHERE    NOW() BETWEEN de.from_date AND de.to_date
 );
``{{execute}}

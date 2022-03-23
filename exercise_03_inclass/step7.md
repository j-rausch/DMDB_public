[Employees] Use the view from the previous task to determine the employees (give their full names) earning between the 45th and 55th percentile of the current salary distribution in the company

1.
``
CREATE VIEW DeptManager AS
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e, dept_manager dm
WHERE e.emp_no = dm.emp_no;
``{{execute}}


2.
``
CREATE VIEW Age AS
SELECT emp_no, first_name, last_name, DATE_PART('year', age(NOW(), birth_date)) AS age
FROM employees;
``{{execute}}


3.
``
CREATE VIEW HiredPast97 AS
SELECT * FROM employees
WHERE hire_date >= '01.01.1997';
``{{execute}}


4.
``
CREATE VIEW DeptEmployee AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no;
``{{execute}}


5.
``
CREATE VIEW Depts AS
SELECT e.emp_no, COUNT(*) AS number_of_depts
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no
GROUP BY  e.emp_no;
``{{execute}}


6.
``
CREATE VIEW HiredIn AS
SELECT EXTRACT(YEAR FROM hire_date) AS year_hired, COUNT(*)
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date);
``{{execute}}

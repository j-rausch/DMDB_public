[Employee] Which of the following views are updatable?


1.

``
CREATE VIEW DeptManager AS
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e, dept_manager dm
WHERE e.emp_no = dm.emp_no;
``{{execute}}

test:
``
UPDATE dept_manager SET dept_no=1;
``{{execute}}



2.
``
CREATE VIEW Age AS
SELECT emp_no, first_name, last_name, DATE_PART('year', age(NOW(), birth_date)) AS age
FROM employees;
``{{execute}}

test:
``
UPDATE Age SET last_name='abc';
``{{execute}}

``
UPDATE Age SET age=20;
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



1 and 4 are not updatable because of table joins.
5 is not updatable because of table joins and aggregation.
6 is not updatable because of aggregation.

NOTE: 2 is updatable, but you cannot update the 'age' field because of a one-way projection.

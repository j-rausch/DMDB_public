[Employees] Create a view (current_employees) that contains the employee numbers and salaries of employees who are currently working at the company. Based on this view compute the average salary at the current moment.

-- Create view

``
CREATE	VIEW current_employees AS (
        SELECT	emp_no, salary
        FROM     salaries
        WHERE  to_date >= NOW()
);
``{{execute}}


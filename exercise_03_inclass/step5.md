[Employees] Use the view from the previous task to determine the employees (give their full names) earning between the 45th and 55th percentile of the current salary distribution in the company

Fill the gaps to obtain a correct query:


``
[[1]] ranked_current_employees AS (

[[2]] *, [[3]]
[[4]] AS rank
FROM     current_employees
)
SELECT e.first_name, e.last_name, salary
FROM     ranked_current_employees ce
JOIN       employees e ON e.emp_no = ce.emp_no
WHERE  rank [[5]] 0.45 [[6]] 0.55
``{{execute}}

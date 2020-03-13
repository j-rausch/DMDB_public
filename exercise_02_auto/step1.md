For the following exercises, we work on one of three datasets.

To run queries on the datasets, we connect to them as follows:

Employees:

``psql``{{execute}}

``\c employee``{{execute}}

We can now run queries on the connected dataset. For example, to return employee's first names:

``
SELECT e.first_name
FROM employees e
LIMIT 5;
``{{execute}}


We can use the same command to connect to the TPC-H dataset:

``\c tpch``{{execute}}


and the ZVV dataset:

``\c zvv``{{execute}}



Using the command line interface, we can now run and test different SQL queries that are discussed in the exercise.

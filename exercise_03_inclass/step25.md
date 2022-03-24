[Employee2]

Part 2.

We want to find out how many contracts (entries in the Salaries table) ended in each particular year. 
For this we could use the following query:

``
SELECT EXTRACT(YEAR FROM to_date) AS year_expired, COUNT(*) AS num_expired
FROM salaries
GROUP BY year_expired
ORDER BY year_expired;
``{{execute}}

Additionally, here is a similar query written more verbose: 

``
(SELECT EXTRACT(YEAR FROM to_date) AS year_expired, COUNT(*) AS num_expired
  FROM salaries
  WHERE EXTRACT(YEAR FROM to_date) <= 1990
  GROUP BY year_expired
  ORDER BY year_expired)
UNION ALL
(SELECT EXTRACT(YEAR FROM to_date) AS year_expired, COUNT(*) AS num_expired
  FROM salaries
  WHERE EXTRACT(YEAR FROM to_date) > 1990
  GROUP BY year_expired
  ORDER BY year_expired);
``{{execute}}

What can we say about the two queries? (below are some options)

- Query 1 and Query 2 return the same set of groups.

- Query 1 returns more groups than Query 2.

- Query 2 returns more groups than Query 1

- Query 1 has one group more than Query 2

- Query 2 has one group more than Query 1

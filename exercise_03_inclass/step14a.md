[ZVV] Consider the following queries. All queries are valid and return some result.

Which queries are equivalent? Two queries are equivalent if they return the same set of results for any data that the database may contain (provided the schema does not change). Select all queries that are equivalent to at least one other query in the list.

Part 2

Query 1.
``
SELECT COUNT(*)
FROM trips;
``{{execute}}
Count all trips

Query 2.
``
SELECT COUNT(*)
FROM trips t
JOIN stop_times st USING(trip_id);
``{{execute}}
Count all stop times


Query 3.
``
SELECT COUNT(*)
FROM stop_times
GROUP BY trip_id;
``{{execute}}
Count all stop times for each trip


Query 4.
``
SELECT COUNT(*)
FROM trips
JOIN stop_times USING(trip_id)
JOIN stops USING(stop_id)
WHERE stop_name LIKE '%';
``{{execute}}
Count all stop times


Query 5.
``
SELECT SUM(valA)
FROM (SELECT stop_name, COUNT(*) AS valA
                FROM stop_times
                JOIN stops USING(stop_id)
                GROUP BY stop_name) tabA;
``{{execute}}
Count all stop times
(Sum of counts acts as 'max of max')

Subqueries:
``
SELECT stop_name, COUNT(*) AS valA
                  FROM stop_times
                  JOIN stops USING(stop_id)
                  GROUP BY stop_name;
``{{execute}}


``
 SELECT SUM(valA)
 FROM (SELECT stop_name, COUNT(*) AS valA
                 FROM stop_times
                 JOIN stops USING(stop_id)
                 GROUP BY stop_name) tabA;
``{{execute}}


Query 6.
``
SELECT COUNT(DISTINCT trip_id)
FROM stop_times;
``{{execute}}
Count all distinct trips *that have a stop*




Queries 1 and 6 return the number of trips in the database and the number of trips having at least one stop.
They are not equivalent, unless assumed that every trip has at least one stop, which is reasonable but technically not enforced by the schema.

Queries 2, 4 and 5 are equivalent and return the number of stops in the database. The WHERE predicate in query 4 evaluates to true for all non-NULL values, which is guaranteed by the schema for stop_name.

Query 3 returns the number of stops per trip.


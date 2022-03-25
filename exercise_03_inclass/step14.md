[ZVV] Consider the following queries. All queries are valid and return some result.

Which queries are equivalent? Two queries are equivalent if they return the same set of results for any data that the database may contain (provided the schema does not change). Select all queries that are equivalent to at least one other query in the list.

Part 2

Query 1.

``
SELECT COUNT(*)
FROM trips;
``{{execute}}

Query 2.

``
SELECT COUNT(*)
FROM trips t
JOIN stop_times st USING(trip_id);
``{{execute}}


Query 3.

``
SELECT COUNT(*)
FROM stop_times
GROUP BY trip_id;
``{{execute}}


Query 4.

``
SELECT COUNT(*)
FROM trips
JOIN stop_times USING(trip_id)
JOIN stops USING(stop_id)
WHERE stop_name LIKE '%';
``{{execute}}


Query 5.

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


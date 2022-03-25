[ZVV] Consider the following queries. All queries are valid and return some result.

Which queries are equivalent? Two queries are equivalent if they return the same set of results for any data that the database may contain (provided the schema does not change). Select all queries that are equivalent to at least one other query in the list.

Part 1

Query 1.
``
SELECT arrival_time
FROM stop_times
ORDER BY arrival_time DESC
LIMIT 1;
``{{execute}}

Query 2.
``
SELECT MAX(arrival_time)
FROM stop_times
JOIN trips USING (trip_id);
``{{execute}}


Query 3.
``
SELECT MAX(arrival_time)
FROM stop_times
GROUP BY trip_id;
``{{execute}}


Query 4.
``
SELECT MAX(arrival_time) as arrival_time
FROM stop_times st
JOIN trips t USING(trip_id)
GROUP BY t.trip_id
ORDER BY arrival_time DESC
LIMIT 1;
``{{execute}}



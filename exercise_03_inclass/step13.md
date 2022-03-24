[ZVV] Consider the following queries. All queries are valid and return some result.

Which queries are equivalent? Two queries are equivalent if they return the same set of results for any data that the database may contain (provided the schema does not change). Select all queries that are equivalent to at least one other query in the list.

Part 1

1.
``
SELECT arrival_time
FROM stop_times
ORDER BY arrival_time DESC
LIMIT 1;
``{{execute}}

2.
``
SELECT MAX(arrival_time)
FROM stop_times
JOIN trips USING (trip_id);
``{{execute}}


3.
``
SELECT MAX(arrival_time)
FROM stop_times
GROUP BY trip_id;
``{{execute}}


4.
``
SELECT MAX(arrival_time) as arrival_time
FROM stop_times st
JOIN trips t USING(trip_id)
GROUP BY t.trip_id
ORDER BY arrival_time DESC
LIMIT 1;
``{{execute}}



Queries 1, 2 and 4 are equivalent and return the maximum arrival time in the database.

Query 3 returns the maximum arrival time per trip.

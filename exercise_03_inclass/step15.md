[ZVV]

Part 1.

A tram track is defined as a tuple of two consecutive stops (stop_name1 , stop_name2 ). Two stops are consecutive, if there is a trip (trip_id) which contains both stops and in which their stop_sequence numbers differ by 1:

stop_sequence(stop_name2) = 1 + stop_sequence(stop_name1)

Find the query to obtain a SQL query that finds the number of trips for each tram track and lists the 10 most frequented ones.


``
SELECT s1.stop_name, s2.stop_name, COUNT(*) AS tcount
FROM stop_times st1, stop_times st2, stops s1, stops s2
WHERE  [[]]
AND [[]]
AND s1.stop_id=st1.stop_id AND s2.stop_id=st2.stop_id
GROUP BY [[]]
ORDER BY [[]]
LIMIT 10;
``{{execute}}



[ZVV]

Part 2.

A tram stop (stop_name) is terminal if it is the last stop for any trip (as identified by the trip_id). The last stop of a trip can be identified by its stop_sequence. For example, if a tram makes a trip along six tram stops, stop_sequence = 6 identifies the last stop of the trip.

Fill in the blanks below to obtain an SQL query that finds all terminal tram stops (stop_name). Also make sure the result does not contain duplicate entries.

``
SELECT DISTINCT stop_name
FROM stops s JOIN stop_times st1 USING(stop_id),
(SELECT trip_id,MAX(stop_sequence) AS maxStop
FROM stop_times
GROUP BY trip_id ) st2
WHERE st1.trip_id=st2.trip_id
AND st1.stop_sequence=st2.maxStop;

``{{execute}}


[ZVV]

Part 2.

A tram stop (stop_name) is terminal if it is the last stop for any trip (as identified by the trip_id). The last stop of a trip can be identified by its stop_sequence. For example, if a tram makes a trip along six tram stops, stop_sequence = 6 identifies the last stop of the trip.

Find the SQL query that finds all terminal tram stops (stop_name). We also make sure the result does not contain duplicate entries.

``
SELECT [[]]
FROM stops s JOIN stop_times st1 USING(stop_id),
(SELECT [[]]  AS maxStop
FROM [[]]
GROUP BY [[]] ) st2
WHERE [[]]
AND [[]]=st2.maxStop;
``{{execute}}



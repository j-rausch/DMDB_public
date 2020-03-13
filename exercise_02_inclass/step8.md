The following queries refer to the ZVV database:

``\c zvv``{{execute}}


Overview:

``
SELECT * FROM stop_times ORDER BY trip_id, arrival_time;
``{{execute}}


``
SELECT * FROM trips;
``{{execute}}


Given the following query which is the statement that describes best the operation it performs.

``
SELECT	COUNT(*) AS count_trips, tram_number
FROM	trips
GROUP	BY tram_number
ORDER	BY count_trips DESC;
``{{execute}}

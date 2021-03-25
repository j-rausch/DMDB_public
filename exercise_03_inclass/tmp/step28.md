[ZVV] List all single transfer connections that depart from stations with a name that contains 'ETH' and arrive at stations with a name that contains 'Seebach'. The departure time **departure_time** and arrival time **arrival_time** must be between '13:00:00' and '14:00:00'.

For each connection show:

For the first tram:
departure **stop_name** ,
**tram_number**,
**departure_time**,
trip direction (**trip_headsign**),
**arrival_time** at intermediate stop,
intermediate **stop_name**.
For the second tram:
**tram_number**,
**departure_time**,
trip direction (**trip_headsign**),
**arrival_time** at destination stop,
destination **stop_name**.


A *single transfer* connection is associated with 2 trips (e.g. T1, T2) and 3 stops (e.g. S1, S2, S3), where T1 stops at S1 and S2, while T2 stops at S2 and S3. Pay attention to the order of the stops and that the arrival time for T1 at S2 is no later than the departure time of T2 at S2.


-- Option 1 -- readable, but slow.
``
WITH connections AS (
SELECT	ss.stop_name AS start_name, es.stop_name AS end_name, st.departure_time AS dtime, et.arrival_time AS atime, t.tram_number, trip_headsign
FROM     stops ss
JOIN       stop_times st ON ss.stop_id = st.stop_id
JOIN       stop_times et ON et.trip_id = st.trip_id
JOIN       stops es ON es.stop_id = et.stop_id
JOIN       trips t ON et.trip_id = t.trip_id
WHERE  st.stop_sequence < et.stop_sequence
               -- Comment in the following two lines to make it faster
               -- AND st.departure_time BETWEEN '13:00:00' AND '14:00:00'
               -- AND st.arrival_time BETWEEN '13:00:00' AND '14:00:00'
)
SELECT	c1.start_name, c1.tram_number, c1.trip_headsign, c1.dtime, c1.atime, c1.end_name, c2.tram_number, c2.trip_headsign, c2.dtime, c2.atime, c2.end_name
FROM    connections c1
JOIN      connections c2 ON c1.end_name = c2.start_name
WHERE c1.start_name LIKE '%ETH%'
              AND c2.end_name LIKE '%Seebach%'
              AND c1.atime < c2.dtime
              AND c1.dtime BETWEEN '13:00:00' AND '14:00:00'
              AND c2.atime BETWEEN '13:00:00' AND '14:00:00'
ORDER BY c1.dtime
``{{execute}}


-- Option 2 -- much faster, but less readable.
``
 SELECT	depS.stop_name, ft.tram_number, ft.trip_headsign, depST.departure_time AS dep_time, st.arrival_time, sint.stop_name, str.trip_headsign, str.tram_number, st1.departure_time, st2.arrival_time AS arr_time, s.stop_name
FROM	stop_times depST, stops depS, stop_times st, stop_times st1, stop_times st2, stops s, stops sint, trips ft, trips str
WHERE	depS.stop_name LIKE '%ETH%'
               AND depST.stop_id = depS.stop_id
               AND depST.departure_time BETWEEN '13:00:00' AND '14:00:00'
               AND st.trip_id = ft.trip_id
               AND st.trip_id = depST.trip_id
               AND st1.trip_id = str.trip_id
               AND st.departure_time BETWEEN '13:00:00' AND '14:00:00'
               AND st.arrival_time > depST.departure_time
               AND st.stop_id = st1.stop_id
               AND st.stop_id = sint.stop_id
               AND st.arrival_time < st1.departure_time
               AND st1.departure_time BETWEEN '13:00:00' AND '14:00:00'
               AND st1.trip_id = st2.trip_id
               AND st2.arrival_time > st1.departure_time
               AND st2.arrival_time BETWEEN '13:00:00' AND '14:00:00'
               AND st2.stop_id = s.stop_id
               AND s.stop_name LIKE '%Seebach%'
ORDER	BY st2.arrival_time ASC
``{{execute}}


-- In theory, the database system should be able to transform one query to the other and execute both queries in the same time. Under this assumption, it is better to write the queries such that other programmers can easily understand them. In practice, unfortunately, there may be performance differences like here. Note that the question does not exclude journeys with a single trip where we get off a tram and then back on the same one. If we wanted to exclude that, we could do so with an additional WHERE clause that checks that the \(\verb|trip_id|\)s of the to trips are different.
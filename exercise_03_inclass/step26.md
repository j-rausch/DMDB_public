``\c zvv``{{execute}}

[ZVV] List all direct connections that depart from stations that contain 'ETH' in the station's name (**stop_name**) and arrive at stations that contain 'Milchbuck' in the name. The departure time (**departure_time**) and arrival time (**arrival_time**) must be between '13:00:00' and '14:00:00'.

Show the **stop_name** of the departing station, **stop_name** of the arrival station, the **tram_number** of the tram line, the **departure_time**, **arrival_time** and trip direction **trip_headsign**.

Order the list in ascending order by **departure_time**.

``
WITH connections AS (
SELECT ss.stop_name AS start_name, es.stop_name AS end_name, st.departure_time AS dtime, et.arrival_time AS atime, tram_number, trip_headsign
FROM    stops ss
JOIN      stop_times st ON ss.stop_id = st.stop_id
JOIN      stop_times et ON et.trip_id = st.trip_id
JOIN      stops es ON es.stop_id = et.stop_id
JOIN      trips t ON et.trip_id = t.trip_id
WHERE st.stop_sequence < et.stop_sequence
)
SELECT *
FROM    connections
WHERE start_name LIKE '%ETH%'
               AND end_name LIKE '%Milchbuck%'
               AND dtime >= '13:00:00'
               AND atime <= '14:00:00'
ORDER  BY dtime
``{{execute}}

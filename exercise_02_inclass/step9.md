The following queries try to compute the top 10 stations according to the number of times that any tram stops at that station.


A) 

``
SELECT	s.stop_id, s.stop_name
FROM	stop_times st, stops s
WHERE	s.stop_id = st.stop_id
GROUP	BY st.stop_id, s.stop_name
ORDER	BY count_stations DESC;
``{{execute}}


B) 

``
SELECT	count_stations, s.stop_name
FROM	stop_times st, stops s
WHERE	s.stop_id = st.stop_id
GROUP 	BY st.stop_id
ORDER 	BY count_stations DESC
LIMIT 	10;
``{{execute}}


C) 

``
SELECT	COUNT(*) AS count_stations, s.stop_name
FROM	stop_times st, stops s
WHERE	s.stop_id = st.stop_id
GROUP	BY st.stop_id, s.stop_name
ORDER	BY count_stations DESC
LIMIT	10;
``{{execute}}

GROUP BY s.stop\_name because of projection on stop\_name 


D) 

``
SELECT	COUNT(*) AS count_stations, s.stop_name
FROM	stop_times st, stops s
WHERE	s.stop_id = st.stop_id
GROUP	BY st.stop_id
ORDER	BY count_stations DESC;
``{{execute}}



Looking intto query C:

``
SELECT	st.stop_id, s.stop_name
FROM	stop_times st, stops s
WHERE	s.stop_id = st.stop_id
``{{execute}}


``
SELECT	st.stop_id, s.stop_name
FROM	stop_times st, stops s
WHERE	s.stop_id = st.stop_id
ORDER BY st.stop_id
``{{execute}}


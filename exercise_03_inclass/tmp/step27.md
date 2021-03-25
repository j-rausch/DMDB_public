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


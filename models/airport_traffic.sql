WITH departures as (
SELECT departure_airport_id as airport_id, date(departure_actual) as date, count(*) as volume
FROM {{ ref("flights") }}
GROUP BY ALL
),

arrivals as (
SELECT arrival_airport_id as airport_id, date(arrival_actual) as date, count(*) as volume
FROM {{ ref("flights") }}
GROUP BY ALL
)

SELECT 
    nvl(departures.airport_id, arrivals.airport_id) as airport_id,
    nvl(departures.date, arrivals.date) as date,
    nvl(departures.volume, 0) as departures,
    nvl(arrivals.volume, 0) as arrivals
FROM 
    departures
    LEFT OUTER JOIN arrivals 
        ON departures.airport_id = arrivals.airport_id
            AND departures.date = arrivals.date
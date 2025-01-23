

SELECT 
    date,
    location,
    operator,
    flightno as flight_no,
    route,
    CASE WHEN CONTAINS(route,'-') THEN SPLIT_PART(route, '-',1) ELSE null END as source,
    CASE WHEN CONTAINS(route,'-') THEN SPLIT_PART(route, '-',-1) ELSE null END as destination,
    type as plane_type,
    aboard,
    fatalities,
    ground as ground_fatalities,
    summary as crash_description,
    CASE
        WHEN CONTAINS(lower(summary), 'midair collision') THEN 'Midair Collision'
        WHEN CONTAINS(lower(summary), 'runway incursion') THEN 'Midair Collision'
        WHEN CONTAINS(lower(summary), 'pilot error') THEN 'Pilot Error'
        WHEN CONTAINS(lower(summary), 'shot') THEN 'Shot Down'
        WHEN CONTAINS(lower(summary), 'engine')
            OR CONTAINS(lower(summary), 'fuel') THEN 'Engine / Fuel Trouble'
        WHEN CONTAINS(lower(summary), 'power') THEN 'Loss of Power'
        WHEN CONTAINS(lower(summary), 'explo') 
            OR CONTAINS(lower(summary), 'bomb') THEN 'Explosion'
        WHEN CONTAINS(lower(summary), 'hill') 
            OR CONTAINS(lower(summary), 'high ground')
            OR CONTAINS(lower(summary), 'tree')
            OR CONTAINS(lower(summary), 'power line')
            OR CONTAINS(lower(summary), 'mt.')
            OR CONTAINS(lower(summary), 'peak')
            OR CONTAINS(lower(summary), 'ridge')
            OR CONTAINS(lower(summary), 'mount') THEN 'Crashed Into Terrain'
        WHEN CONTAINS(lower(summary), 'weather') 
            OR CONTAINS(lower(summary), 'lightning') 
            OR CONTAINS(lower(summary), 'blizzard')
            OR CONTAINS(lower(summary), 'rain')
            OR CONTAINS(lower(summary), 'tornado') 
            OR CONTAINS(lower(summary), 'fog') 
            OR CONTAINS(lower(summary), 'gale force wind') 
            OR CONTAINS(lower(summary), 'storm') THEN 'Weather'
        WHEN CONTAINS(lower(summary), 'icing') 
            OR CONTAINS(lower(summary), 'ice') THEN 'Ice'
        WHEN CONTAINS(lower(summary), 'smoke') 
            OR CONTAINS(lower(summary), 'burn')
            OR CONTAINS(lower(summary), 'flame')
            OR CONTAINS(lower(summary), 'fire') THEN 'Smoke / Fire'
        WHEN CONTAINS(lower(summary), 'separate')
            OR CONTAINS(lower(summary), 'fuselage')
            OR CONTAINS(lower(summary), 'structural failure')
            OR CONTAINS(lower(summary), 'broke') THEN 'Fuselage Failure'
        WHEN CONTAINS(lower(summary), 'control') THEN 'Control Problem'
        WHEN CONTAINS(lower(summary), 'takeoff') 
            OR CONTAINS(lower(summary), 'took off')
            OR CONTAINS(lower(summary), 'taking off')
            OR CONTAINS(lower(summary), 'take off') THEN 'Takeoff'
        WHEN CONTAINS(lower(summary), 'land') 
            OR CONTAINS(lower(summary), 'approach') THEN 'Landing'
        WHEN CONTAINS(lower(summary), 'stall') THEN 'Stalled'
        WHEN CONTAINS(lower(summary), 'unknown')
            OR CONTAINS(lower(summary), 'disappear')
            OR CONTAINS(lower(summary), 'missing')
            OR CONTAINS(lower(summary), 'vanish') THEN 'Unknown'
        ELSE null
        END as crash_type
FROM {{ source("flight_crashes", "crashes_and_fatalities")}}

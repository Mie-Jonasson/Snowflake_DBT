SELECT 
    flight_id,
    flight_number,
    flight_date_local as flight_date,
    is_diverted,
    is_cancelled,
    actual_flight_duration as flight_duration,
    departure_airport_id,
    scheduled_runway_departure_local as departure_expected,
    actual_runway_departure_local as departure_actual,
    actual_taxi_out_time as departure_taxi_time,
    gate_departure_delay as departure_delay,
    arrival_airport_id,
    scheduled_runway_arrival_local as arrival_expected,
    actual_runway_arrival_local as arrival_actual,
    actual_taxi_in_time as arrival_taxi_time,
    gate_arrival_delay as arrival_delay
FROM {{ source("flights", "flights") }}
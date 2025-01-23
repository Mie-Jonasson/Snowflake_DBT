SELECT 
    airport_ident as airport_id,
    type,
    name,
    elevation_ft,
    iso_country as country_code, 
    municipality,
    runway_length_ft,
    runway_width_ft,
    runway_surface,
    runway_lighted
FROM {{ source("flight_crashes", "airports") }}
WHERE type not in ('closed','heliport','seaplane_base','balloonport')
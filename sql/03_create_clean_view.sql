/* 03_create_clean_view.sql
 Purpose: Cleaned view for analysis (trim strings, keep NULLs).
 */
USE bike_share;
CREATE OR REPLACE VIEW trips_clean AS
SELECT ride_id,
  rideable_type,
  started_at,
  ended_at,
  NULLIF(TRIM(start_station_name), '') AS start_station_name,
  NULLIF(TRIM(start_station_id), '') AS start_station_id,
  NULLIF(TRIM(end_station_name), '') AS end_station_name,
  NULLIF(TRIM(end_station_id), '') AS end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM trips_raw
WHERE started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND ended_at > started_at;
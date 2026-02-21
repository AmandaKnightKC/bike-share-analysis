/* 04_build_fact_table.sql
   Purpose: Build analytics-friendly fact table from trips_clean.
*/

USE bike_share;

DROP TABLE IF EXISTS fact_trips;

CREATE TABLE fact_trips AS
SELECT
  ride_id,
  rideable_type,
  member_casual,
  started_at,
  ended_at,

  -- Derived metrics
  TIMESTAMPDIFF(SECOND, started_at, ended_at) AS duration_seconds,
  DATE(started_at) AS ride_date,
  YEAR(started_at) AS ride_year,
  MONTH(started_at) AS ride_month,
  DAYOFWEEK(started_at) AS dow,
  HOUR(started_at) AS start_hour,

  start_station_id,
  start_station_name,
  end_station_id,
  end_station_name,
  start_lat, start_lng, end_lat, end_lng
FROM trips_clean
WHERE started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND ended_at > started_at;

-- Quick checks
SELECT COUNT(*) AS fact_rows FROM fact_trips;

SELECT member_casual, COUNT(*) AS rides
FROM fact_trips
GROUP BY member_casual;
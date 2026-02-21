/* 02_load_raw_one_month.sql
   Purpose: Load ONE monthly CSV into trips_raw.
   Note: Assumes Windows line endings (\r\n) and timestamps with milliseconds.
*/

USE bike_share;
SELECT DATABASE();
-- TRUNCATE TABLE trips_raw;
LOAD DATA INFILE '/var/lib/mysql-files/202501-divvy-tripdata.csv' INTO TABLE trips_raw FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS (
  ride_id,
  rideable_type,
  @started_at,
  @ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  @start_lat,
  @start_lng,
  @end_lat,
  @end_lng,
  member_casual
)
SET ride_id = TRIM(ride_id),
  rideable_type = TRIM(rideable_type),
  start_station_name = TRIM(start_station_name),
  end_station_name = TRIM(end_station_name),
  end_station_id = TRIM(end_station_id),
  start_station_id = TRIM(start_station_id),
  member_casual = TRIM(member_casual),
  started_at = STR_TO_DATE(@started_at, '%Y-%m-%d %H:%i:%s.%f'),
  ended_at = STR_TO_DATE(@ended_at, '%Y-%m-%d %H:%i:%s.%f'),
  start_lat = NULLIF(@start_lat, ''),
  -- resolves incorrect decimal value error by converting empty strings to NULL
  start_lng = NULLIF(@start_lng, ''),
  end_lat = NULLIF(@end_lat, ''),
  end_lng = NULLIF(@end_lng, '');

  
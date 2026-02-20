LOAD DATA INFILE '/var/lib/mysql-files/202501-divvy-tripdata.csv'
INTO TABLE trips_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
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
SET
  started_at = STR_TO_DATE(@started_at, '%Y-%m-%d %H:%i:%s'),
  ended_at   = STR_TO_DATE(@ended_at,   '%Y-%m-%d %H:%i:%s'),
  start_lat  = NULLIF(@start_lat,''),
  start_lng  = NULLIF(@start_lng,''),
  end_lat    = NULLIF(@end_lat,''),
  end_lng    = NULLIF(@end_lng,'');
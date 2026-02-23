DB="bike_share"
DB_USER="cms_analyst"

#clear the table once
mysql -u "$DB_USER" -p "$DB" -e "TRUNCATE TABLE trips_raw;"

FILES=$(sudo find /var/lib/mysql-files -maxdepth 1 -type f -name "2025*-divvy-tripdata.csv" | sort)

for f in $FILES; do
    echo "Loading $(basename "$f") ..."

    mysql -u "$DB_USER" -p "$DB" <<SQL
LOAD DATA INFILE '$f'
INTO TABLE trips_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
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
  @member_casual
)
SET
  ride_id = TRIM(ride_id),
  rideable_type = TRIM(rideable_type),
  start_station_name = NULLIF(TRIM(start_station_name), ''),
  start_station_id   = NULLIF(TRIM(start_station_id), ''),
  end_station_name   = NULLIF(TRIM(end_station_name), ''),
  end_station_id     = NULLIF(TRIM(end_station_id), ''),
  member_casual      = NULLIF(TRIM(BOTH '\r' FROM TRIM(@member_casual)), ''),
  started_at = STR_TO_DATE(@started_at, '%Y-%m-%d %H:%i:%s.%f'),
  ended_at   = STR_TO_DATE(@ended_at,   '%Y-%m-%d %H:%i:%s.%f'),
  start_lat  = NULLIF(TRIM(@start_lat), ''),
  start_lng  = NULLIF(TRIM(@start_lng), ''),
  end_lat    = NULLIF(TRIM(@end_lat), ''),
  end_lng    = NULLIF(TRIM(@end_lng), '');
SQL
done
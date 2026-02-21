CREATE TABLE trips_raw (
    ride_id VARCHAR(50),
    rideable_type VARCHAR(30),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(150),
    start_station_id VARCHAR(50),
    end_station_name VARCHAR(150),
    end_station_id VARCHAR(50),
    start_lat DECIMAL(10, 6) Null,
    start_lng DECIMAL(10, 6) Null,
    end_lat DECIMAL(10, 6) Null,
    end_lng DECIMAL(10, 6) Null,
    member_casual VARCHAR(20)
);
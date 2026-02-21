/* ============================================================
 Bike Share Analysis Project
 Author: Amanda Knight
 Purpose:
 Rebuild the raw ingestion table for the Chicago Divvy
 bike share dataset. This table stores the CSV exactly as
 received (minimal transformation).
 
 01_create_schema.sql
   Purpose: Create the staging (raw) table.
   Run: mysql -u cms_analyst -p bike_share < sql/01_create_schema.sql
 */
-- rebuild raw ingestion table
USE bike_share;
DROP TABLE IF EXISTS trips_raw;
CREATE TABLE trips_raw (
    ride_id VARCHAR(50),
    rideable_type VARCHAR(30),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(150),
    start_station_id VARCHAR(50),
    end_station_name VARCHAR(150),
    end_station_id VARCHAR(50),
    start_lat DECIMAL(10, 6) NULL,
    start_lng DECIMAL(10, 6) NULL,
    end_lat DECIMAL(10, 6) NULL,
    end_lng DECIMAL(10, 6) NULL,
    member_casual VARCHAR(20)
);
-- load 1 month of data for testing
-- source file from mysql terminal
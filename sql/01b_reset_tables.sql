-- This script truncates all tables in the lead_scoring database to reset them for a new data load.
USE bike_share;

-- Clear downstream tables first
TRUNCATE TABLE fact_trips;
TRUNCATE TABLE trips_raw;
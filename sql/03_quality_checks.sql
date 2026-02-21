-- hidden characters?
SELECT DISTINCT LENGTH(member_casual),
    member_casual
FROM trips_raw;
-- hidden characters?
SELECT DISTINCT member_casual
FROM trips_raw;
-- hex code for hidden character is 0D (carriage return)
-- check for hidden characters in member_casual
SELECT member_casual,
    LENGTH(member_casual) AS length,
    HEX(member_casual) AS raw_bytes
FROM trips_raw
LIMIT 10;
-- check for leading/trailing spaces in start_station_name
SELECT COUNT(*) AS rows_with_spaces
FROM trips_raw
WHERE end_station_name LIKE ' %' -- starts with a space
    OR end_station_name LIKE '% ';

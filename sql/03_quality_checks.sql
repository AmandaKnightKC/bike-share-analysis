-- hidden characters?
SELECT DISTINCT LENGTH(member_casual),
    member_casual as member_casual_distinct_values
FROM trips_raw;
-- hidden characters?
-- SELECT DISTINCT member_casual
-- FROM trips_raw;
-- hex code for hidden character is 0D (carriage return)
-- check for hidden characters in member_casual
-- SELECT COUNT(*) AS rows_with_carriage_return
-- FROM trips_raw
-- WHERE INSTR(member_casual, CHAR(13)) > 0
--     OR INSTR(start_station_name, CHAR(13)) > 0
--     OR INSTR(end_station_name, CHAR(13)) > 0
--     OR INSTR(start_station_id, CHAR(13)) > 0
--     OR INSTR(end_station_id, CHAR(13)) > 0
--     OR INSTR(rideable_type, CHAR(13)) > 0
--     OR instr(ride_id, CHAR(13)) > 0;
-- char(13) is carriage return
-- INSTR(string, substring) returns the position of the first occurrence of substring in string, or 0 if not found
SELECT 'member_casual' AS column_name,
    COUNT(*) AS bad_rows_with_carriage_return
FROM trips_raw
WHERE INSTR(member_casual, CHAR(13)) > 0
UNION ALL
-- UNION ALL combines results from multiple SELECT statements into a single result set, 
-- including duplicates. In this case, it allows us to get counts of bad rows for multiple columns in one query.
SELECT 'start_station_name',
    COUNT(*)
FROM trips_raw
WHERE INSTR(start_station_name, CHAR(13)) > 0
UNION ALL
SELECT 'end_station_name',
    COUNT(*)
FROM trips_raw
WHERE INSTR(end_station_name, CHAR(13)) > 0
UNION ALL
SELECT 'start_station_id',
    COUNT(*)
FROM trips_raw
WHERE INSTR(start_station_id, CHAR(13)) > 0
UNION ALL
SELECT 'end_station_id',
    COUNT(*)
FROM trips_raw
WHERE INSTR(end_station_id, CHAR(13)) > 0
UNION ALL
SELECT 'rideable_type',
    COUNT(*)
FROM trips_raw
WHERE INSTR(rideable_type, CHAR(13)) > 0
UNION ALL
SELECT 'ride_id',
    COUNT(*)
FROM trips_raw
WHERE INSTR(ride_id, CHAR(13)) > 0;
--  check for leading/trailing spaces in string columns
SELECT COUNT(*) AS rows_with_trailing_leading_spaces
FROM trips_raw
WHERE start_station_name LIKE ' %'
    OR start_station_name LIKE '% '
    OR end_station_name LIKE ' %'
    OR end_station_name LIKE '% '
    OR start_station_id LIKE ' %'
    OR start_station_id LIKE '% '
    OR end_station_id LIKE ' %'
    OR end_station_id LIKE '% '
    OR member_casual LIKE ' %'
    OR member_casual LIKE '% ';
-- check for invalid timestamps (ended_at before started_at)
SELECT COUNT(*) AS bad_time_rows_in_raw
FROM trips_raw
WHERE ended_at < started_at;
SELECT COUNT(*) AS bad_rows_in_clean
FROM trips_clean
WHERE ended_at < started_at;
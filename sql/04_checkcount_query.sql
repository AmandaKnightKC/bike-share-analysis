SELECT COUNT(*)
FROM trips_raw;
SELECT member_casual,
    COUNT(*)
FROM trips_raw
GROUP BY member_casual;
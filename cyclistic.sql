--Checking for dublicates--

Select * From public."202404-divvy";
Select DISTINCT * From public."202404-divvy";

Select * From public."202405-divvy";
Select DISTINCT * From public."202405-divvy";

Select * From public."202406-divvy";
Select DISTINCT * From public."202406-divvy";

Select * From public."202407-divvy";
Select DISTINCT * From public."202407-divvy";

Select * From public."202408-divvy";
Select DISTINCT * From public."202408-divvy";

Select * From public."202409-divvy";
Select DISTINCT * From public."202409-divvy";

Select * From public."202410-divvy";
Select DISTINCT * From public."202410-divvy";

Select * From public."202411-divvy";
Select DISTINCT * From public."202411-divvy";

Select * From public."202412-divvy";
Select DISTINCT * From public."202412-divvy";

Select * From public."202501-divvy";
Select DISTINCT * From public."202501-divvy";

Select * From public."202502-divvy";
Select DISTINCT * From public."202502-divvy";

Select * From public."202503-divvy";
Select DISTINCT * From public."202503-divvy";

CREATE TABLE all_data AS

SELECT * FROM public."202404-divvy"
UNION ALL
SELECT * FROM public."202405-divvy"
UNION ALL
SELECT * FROM public."202406-divvy"
UNION ALL
SELECT * FROM public."202407-divvy"
UNION ALL
SELECT * FROM public."202408-divvy"
UNION ALL
SELECT * FROM public."202409-divvy"
UNION ALL
SELECT * FROM public."202410-divvy"
UNION ALL
SELECT * FROM public."202411-divvy"
UNION ALL
SELECT * FROM public."202412-divvy"
UNION ALL
SELECT * FROM public."202501-divvy"
UNION ALL
SELECT * FROM public."202502-divvy"
UNION ALL
SELECT * FROM public."202503-divvy";

ANALYZE all_data;

SELECT * FROM all_data;

-- Exploring 100 random records --
SELECT * FROM all_data 
WHERE ride_id IN (
SELECT ride_id FROM all_data
ORDER BY RANDOM()
LIMIT 100);

ALTER TABLE all_data
ADD COLUMN ride_length interval;

UPDATE all_data
SET ride_length = ended_at - started_at;

ALTER TABLE all_data
ADD COLUMN day_of_week TEXT;

UPDATE all_data
SET day_of_week = TRIM(TO_CHAR (started_at, 'DAY'));


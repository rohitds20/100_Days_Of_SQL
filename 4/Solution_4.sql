SELECT
    fv.name AS Name,
    fv.floor AS Most_Visited_Floor,
    tv.total_visits AS Total_Visits,
    ar.used_resources AS Resources_Used
FROM
    (
        SELECT name, floor, cnt, RANK() OVER (PARTITION BY name ORDER BY cnt DESC) AS rn
        FROM (
            SELECT name, floor, COUNT(*) AS cnt
            FROM entries
            GROUP BY name, floor
        ) AS floor_counts
    ) AS fv
JOIN
    (
        SELECT name, COUNT(*) AS total_visits, STRING_AGG(resources, ',') AS resources_used
        FROM entries
        GROUP BY name
    ) AS tv
    ON fv.name = tv.name
JOIN
    (
        SELECT name, STRING_AGG(resources, ',') AS used_resources
        FROM (
            SELECT DISTINCT name, resources
            FROM entries
        ) AS distinct_resources
        GROUP BY name
    ) AS ar
    ON fv.name = ar.name
WHERE fv.rn = 1
ORDER BY fv.name;

-- ################ Alternative Solution with cte ################
WITH
    distinct_resources AS (
        SELECT DISTINCT
            name,
            resources
        FROM entries
    ),
    agg_resources AS (
        SELECT
            name,
            STRING_AGG(resources, ',') AS used_resources
        FROM distinct_resources
        GROUP BY name
    ),
    total_visits AS (
        SELECT
            name,
            COUNT(*) AS total_visits,
            STRING_AGG(resources, ',') AS resources_used
        FROM entries
        GROUP BY name
    ),
    floor_visit AS (
        SELECT
            name,
            floor,
            COUNT(*) AS no_of_floor_visit,
            RANK() OVER (PARTITION BY name ORDER BY COUNT(*) DESC) AS rn
        FROM entries
        GROUP BY name, floor
    )
SELECT
    fv.name AS Name,
    fv.floor AS Most_Visited_Floor,
    tv.total_visits AS Total_Visits,
    ar.used_resources AS Resources_Used
FROM floor_visit fv
JOIN total_visits tv ON fv.name = tv.name
JOIN agg_resources ar ON fv.name = ar.name
WHERE fv.rn = 1
ORDER BY fv.name;
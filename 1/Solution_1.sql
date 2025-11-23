SELECT
    Team_Name,
    COUNT(1) AS Matches_Played,
    SUM(win_flag) AS Matches_Won,
    COUNT(1) - SUM(win_flag) AS Matches_Lost
FROM (
    SELECT
        team1 AS Team_Name,
        CASE WHEN team1 = winner THEN 1 ELSE 0 END AS win_flag
    FROM iccworldcup

    UNION ALL

    SELECT
        team2 AS Team_Name,
        CASE WHEN team2 = winner THEN 1 ELSE 0 END AS win_flag
    FROM iccworldcup
) subquery
GROUP BY Team_Name
ORDER BY Matches_Won DESC;

############ Alternative using CTEs ############

WITH expanded_matches AS (
    -- turn each match into two team-rows with a win flag
    SELECT team1 AS team_name,
           CASE WHEN team1 = winner THEN 1 ELSE 0 END AS is_win
    FROM iccworldcup

    UNION ALL

    SELECT team2 AS team_name,
           CASE WHEN team2 = winner THEN 1 ELSE 0 END AS is_win
    FROM iccworldcup
),
team_summary AS (
    -- aggregate per team
    SELECT
        team_name,
        COUNT(*)           AS Matches_Played,
        SUM(is_win)        AS Matches_Won,
        COUNT(*) - SUM(is_win) AS Matches_Lost
    FROM expanded_matches
    GROUP BY team_name
)
SELECT team_name, Matches_Played, Matches_Won, Matches_Lost
FROM team_summary
ORDER BY Matches_Won DESC;
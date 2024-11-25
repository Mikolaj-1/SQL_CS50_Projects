WITH least_expensive_per_hit AS (
    SELECT pl.id, pl.first_name, pl.last_name, (s.salary / p.H) AS dollars_per_hit
    FROM players pl
    JOIN salaries s ON pl.id = s.player_id
    JOIN performances p ON pl.id = p.player_id AND s.year = p.year
    WHERE s.year = 2001 AND p.year = 2001 AND p.H > 0
    ORDER BY dollars_per_hit ASC
    LIMIT 10
),
least_expensive_per_rbi AS (
    SELECT pl.id, pl.first_name, pl.last_name, (s.salary / p.RBI) AS dollars_per_rbi
    FROM players pl
    JOIN salaries s ON pl.id = s.player_id
    JOIN performances p ON pl.id = p.player_id AND s.year = p.year
    WHERE s.year = 2001 AND p.year = 2001 AND p.RBI > 0
    ORDER BY dollars_per_rbi ASC
    LIMIT 10
)
SELECT le_hit.first_name, le_hit.last_name
FROM least_expensive_per_hit le_hit
JOIN least_expensive_per_rbi le_rbi ON le_hit.id = le_rbi.id
ORDER BY le_hit.id;

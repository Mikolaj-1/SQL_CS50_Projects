SELECT pl.first_name, pl.last_name, (s.salary/p.H) AS "dollars per hit" FROM players pl
JOIN salaries s ON pl.id=s.player_id
JOIN performances p ON pl.id=p.player_id AND s.year=p.year AND p.H>0
WHERE s.year=2001
ORDER BY "dollars per hit", pl.first_name, pl.last_name
LIMIT 10;



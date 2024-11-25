SELECT s.salary FROM salaries s
JOIN performances p ON s.player_id=p.player_id AND s.year=p.year
WHERE p.year=2001 ORDER BY p.HR DESC LIMIT 1;

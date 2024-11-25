SELECT pl.first_name, pl.last_name
FROM players pl JOIN salaries s ON pl.id=s.player_id
ORDER BY salary DESC LIMIT 1;

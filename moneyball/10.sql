SELECT pl.first_name, pl.last_name, s.salary, s.year, p.HR FROM players pl
JOIN salaries s ON pl.id=s.player_id
JOIN performances p ON pl.id=p.player_id AND s.year=p.year
ORDER BY pl.id, s.year DESC, p.HR DESC, s.salary DESC;

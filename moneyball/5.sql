SELECT DISTINCT t.name FROM players pl
JOIN performances p ON pl.id = p.player_id
JOIN teams t ON p.team_id = t.id
WHERE pl.first_name = 'Satchel' AND pl.last_name = 'Paige';

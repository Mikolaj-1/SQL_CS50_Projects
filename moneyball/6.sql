SELECT t.name, SUM(p.H) AS "total hits"
FROM teams t JOIN performances p ON p.team_id=t.id
WHERE p.year=2001
GROUP BY t.name ORDER BY "total hits" DESC LIMIT 5;

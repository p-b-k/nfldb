CREATE OR REPLACE VIEW Byes
AS
SELECT w.week week, UPPER(c.tag) 'conference', d.name 'division', t.name team

FROM (SELECT DISTINCT week from game) w, team t
INNER JOIN division d ON t.dvsn = d.pkey
INNER JOIN conference c ON d.conf = c.pkey

WHERE (w.week, t.name) NOT IN (SELECT week, team from Record)
AND w.season = (SELECT int_val FROM settings WHERE name = 'current_season')

ORDER BY week
;

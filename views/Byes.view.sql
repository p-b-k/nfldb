CREATE VIEW Byes
AS
SELECT w.week week, t.name team
FROM (select distinct week from game) w, team t
WHERE (w.week, t.name) not in (select week, team from Record)
ORDER BY week
;

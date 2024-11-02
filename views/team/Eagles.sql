CREATE VIEW Eagles
AS
SELECT w.week         'week'
     , r.at_home      'at_home'
     , r.oponent      'against'
     , if ((game_for = game_against), 'Tie', if (game_for > game_against, 'Win', 'Loss'))
                      'result'
     , r.game_for     'pts_for'
     , r.game_against 'pts_against'
--   , r.q1_for       'q1_for'
--   , r.q1_against   'q1_against'
--   , r.q2_for       'q2_for'
--   , r.q2_against   'q2_against'
--   , r.q3_for       'q3_for'
--   , r.q3_against   'q3_against'
--   , r.q4_for       'q4_for'
--   , r.q4_against   'q4_against'
--   , r.ot_for       'ot_for'
--   , r.ot_against   'ot_against'
FROM weeks w
LEFT OUTER JOIN Record r ON r.week = w.week
-- INNER JOIN Record r ON r.week = w.week
-- INNER JOIN Stats s ON s.team = r.team
WHERE r.team = 'Eagles'
ORDER BY w.week
;


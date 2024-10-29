CREATE VIEW Stats as
SELECT r.conference
     , r.division
     , r.team
     , count(r.game_for)   'played'
     , sum(r.game_for)     'pts_for'
     , sum(r.game_against) 'pts_against'
     , sum(r.game_net)     'pts_net'
     , sum(r.won_game)     'win'
     , count(r.game_for) - sum(r.won_game)
                           'lose'
     , sum(r.won_game)/count(r.game_for)
                           'pct'
FROM Record r
GROUP BY r.conference, r.division, r.team
;



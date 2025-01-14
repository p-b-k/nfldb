CREATE OR REPLACE VIEW Stats
AS
SELECT r.team_conference conference
     , r.team_division   division
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
     , sum(r.in_conference * r.won_game)/sum(r.in_conference)
                           'pct_conf'
     , sum(r.in_division * r.won_game)/sum(r.in_division)
                           'pct_div'
FROM Record r
GROUP BY r.team_conference, r.team_division, r.team
;



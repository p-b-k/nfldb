CREATE OR REPLACE VIEW StrengthOfSched AS
SELECT r.team_conference                                                'conference'
     , r.team_division                                                  'division'
     , r.team                                                           'team'
     , sum(s.pct) / count(s.pct)                                        'strength'
     , p.pct                                                            'pct'
     , SUM(o.won_game)                                                  'owins'
     , SUM(o.lost_game)                                                 'oloses'
     , SUM(o.won_game)/(SUM(o.won_game) + SUM(o.lost_game))             'oratio'
     , (p.pct + SUM(o.won_game)/(SUM(o.won_game) + SUM(o.lost_game)))/2 'weighted'
FROM Record r
INNER JOIN Stats s ON r.oponent = s.team
INNER JOIN Stats p ON r.team = p.team
INNER JOIN Record o ON r.oponent = o.team
WHERE r.week <= (SELECT int_val FROM settings WHERE name = 'current_week')
GROUP BY r.team
;

CREATE OR REPLACE VIEW StrengthOfSched AS
SELECT r.team_conference                          'conference'
     , r.team_division                            'division'
     , r.team                                     'team'
     , sum(s.pct) / count(s.pct)                  'strength'
     , o.for - o.against                          'op_diff'
     , o.for / o.against                          'op_rat'
     , p.pct                                      'pct'
     , p.pct * (sum(s.pct) / count(s.pct))        'wpct'
     , p.pct * (o.for / o.against)                'wpct2'
FROM Record r
INNER JOIN (SELECT team, SUM(game_for) 'for', SUM(game_against) 'against'
            FROM Record
            GROUP BY team) o ON o.team = r.team
INNER JOIN Stats s ON r.oponent = s.team
INNER JOIN Stats p ON r.team = p.team
WHERE r.week <= (SELECT int_val FROM settings WHERE name = 'current_week')
GROUP BY r.team
;


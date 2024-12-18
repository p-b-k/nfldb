CREATE OR REPLACE VIEW Record
AS
SELECT g.week        'week'
     , upper(tc.tag) 'team_conference'
     , td.name       'team_division'
     , t.name        'team'
     , upper(oc.tag) 'opponent_conference'
     , od.name       'opponent_division'
     , o.name        'opponent'
     , 1             'at_home'
     , if (tc.tag = oc.tag, 1, 0)
                     'in_conference'
     , if (tc.tag = oc.tag and td.name = od.name, 1, 0)
                     'in_division'
     , q1t.amount    'q1_for'
     , q2t.amount    'q2_for'
     , q3t.amount    'q3_for'
     , q4t.amount    'q4_for'
     , ott.amount    'ot_for'
     , q1o.amount    'q1_against'
     , q2o.amount    'q2_against'
     , q3o.amount    'q3_against'
     , q4o.amount    'q4_against'
     , oto.amount    'ot_against'
     , (q1t.amount - q1o.amount) 'q1_net'
     , (q2t.amount - q2o.amount) 'q2_net'
     , (q3t.amount - q3o.amount) 'q3_net'
     , (q4t.amount - q4o.amount) 'q4_net'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount)) 'game_for'
     , (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount)) 'game_against'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount))
       -
       (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount))
       'game_net'
     , if ( (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount))
            >
            (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount))
          , 1
          , 0
          ) 'won_game'
     , if ( (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount))
            <
            (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount))
          , 1
          , 0
          ) 'lost_game'
FROM game g
     inner join team t on g.home = t.pkey
     inner join team o on g.away = o.pkey
     inner join division td on t.dvsn = td.pkey
     inner join conference tc on td.conf = tc.pkey
     inner join division od on o.dvsn = od.pkey
     inner join conference oc on od.conf = oc.pkey
     left outer join score q1t on q1t.team = t.pkey and q1t.quarter = 1 and q1t.game = g.pkey
     left outer join score q2t on q2t.team = t.pkey and q2t.quarter = 2 and q2t.game = g.pkey
     left outer join score q3t on q3t.team = t.pkey and q3t.quarter = 3 and q3t.game = g.pkey
     left outer join score q4t on q4t.team = t.pkey and q4t.quarter = 4 and q4t.game = g.pkey
     left outer join score ott on ott.team = t.pkey and ott.quarter = 5 and ott.game = g.pkey
     left outer join score q1o on q1o.team = o.pkey and q1o.quarter = 1 and q1o.game = g.pkey
     left outer join score q2o on q2o.team = o.pkey and q2o.quarter = 2 and q2o.game = g.pkey
     left outer join score q3o on q3o.team = o.pkey and q3o.quarter = 3 and q3o.game = g.pkey
     left outer join score q4o on q4o.team = o.pkey and q4o.quarter = 4 and q4o.game = g.pkey
     left outer join score oto on oto.team = o.pkey and oto.quarter = 5 and oto.game = g.pkey
UNION
SELECT g.week        'week'
     , upper(tc.tag) 'team_conference'
     , td.name       'team_division'
     , t.name        'team'
     , upper(oc.tag) 'opponent_conference'
     , od.name       'opponent_division'
     , o.name        'opponent'
     , 0             'at_home'
     , if (tc.tag = oc.tag, 1, 0)
                     'in_conference'
     , if (tc.tag = oc.tag and td.name = od.name, 1, 0)
                     'in_division'
     , q1t.amount    'q1_for'
     , q2t.amount    'q2_for'
     , q3t.amount    'q3_for'
     , q4t.amount    'q4_for'
     , ott.amount    'ot_for'
     , q1o.amount    'q1_against'
     , q2o.amount    'q2_against'
     , q3o.amount    'q3_against'
     , q4o.amount    'q4_against'
     , oto.amount    'ot_against'
     , (q1t.amount - q1o.amount) 'q1_net'
     , (q2t.amount - q2o.amount) 'q2_net'
     , (q3t.amount - q3o.amount) 'q3_net'
     , (q4t.amount - q4o.amount) 'q4_net'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount)) 'game_for'
     , (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount)) 'game_against'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount))
       -
       (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount))
       'game_net'
     , if ( (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount))
            >
            (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount))
          , 1
          , 0
          ) 'won_game'
     , if ( (q1t.amount + q2t.amount + q3t.amount + q4t.amount + if (ott.amount is null, 0, ott.amount))
            <
            (q1o.amount + q2o.amount + q3o.amount + q4o.amount + if (oto.amount is null, 0, oto.amount))
          , 1
          , 0
          ) 'lost_game'
FROM game g
     inner join team t on g.away = t.pkey
     inner join team o on g.home = o.pkey
     inner join division td on t.dvsn = td.pkey
     inner join conference tc on td.conf = tc.pkey
     inner join division od on o.dvsn = od.pkey
     inner join conference oc on od.conf = oc.pkey
     left outer join score q1t on q1t.team = t.pkey and q1t.quarter = 1 and q1t.game = g.pkey
     left outer join score q2t on q2t.team = t.pkey and q2t.quarter = 2 and q2t.game = g.pkey
     left outer join score q3t on q3t.team = t.pkey and q3t.quarter = 3 and q3t.game = g.pkey
     left outer join score q4t on q4t.team = t.pkey and q4t.quarter = 4 and q4t.game = g.pkey
     left outer join score ott on ott.team = t.pkey and ott.quarter = 5 and ott.game = g.pkey
     left outer join score q1o on q1o.team = o.pkey and q1o.quarter = 1 and q1o.game = g.pkey
     left outer join score q2o on q2o.team = o.pkey and q2o.quarter = 2 and q2o.game = g.pkey
     left outer join score q3o on q3o.team = o.pkey and q3o.quarter = 3 and q3o.game = g.pkey
     left outer join score q4o on q4o.team = o.pkey and q4o.quarter = 4 and q4o.game = g.pkey
     left outer join score oto on oto.team = o.pkey and oto.quarter = 5 and oto.game = g.pkey
;


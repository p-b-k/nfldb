CREATE VIEW Record as
SELECT g.week       'week'
     , upper(c.tag) 'conference'
     , d.name       'division'
     , t.name       'team'
     , 'Yes'     as 'at_home'
     , o.name       'oponent'
     , q1t.amount   'q1_for'
     , q2t.amount   'q2_for'
     , q3t.amount   'q3_for'
     , q4t.amount   'q4_for'
     , q1o.amount   'q1_against'
     , q2o.amount   'q2_against'
     , q3o.amount   'q3_against'
     , q4o.amount   'q4_against'
     , (q1t.amount - q1o.amount) 'q1_net'
     , (q2t.amount - q2o.amount) 'q2_net'
     , (q3t.amount - q3o.amount) 'q3_net'
     , (q4t.amount - q4o.amount) 'q4_net'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount) 'game_for'
     , (q1o.amount + q2o.amount + q3o.amount + q4o.amount) 'game_against'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount) - (q1o.amount + q2o.amount + q3o.amount + q4o.amount)
       'game_net'
     , if ( (q1t.amount + q2t.amount + q3t.amount + q4t.amount) > (q1o.amount + q2o.amount + q3o.amount + q4o.amount)
          , 1
          , 0
          ) 'won_game'
FROM game g
     inner join team t on g.home = t.pkey
     inner join team o on g.away = o.pkey
     inner join division d on t.dvsn = d.pkey
     inner join conference c on d.conf = c.pkey
     left outer join score q1t on q1t.team = t.pkey and q1t.quarter = 1 and q1t.week = g.week
     left outer join score q2t on q2t.team = t.pkey and q2t.quarter = 2 and q2t.week = g.week
     left outer join score q3t on q3t.team = t.pkey and q3t.quarter = 3 and q3t.week = g.week
     left outer join score q4t on q4t.team = t.pkey and q4t.quarter = 4 and q4t.week = g.week
     left outer join score q1o on q1o.team = o.pkey and q1o.quarter = 1 and q1o.week = g.week
     left outer join score q2o on q2o.team = o.pkey and q2o.quarter = 2 and q2o.week = g.week
     left outer join score q3o on q3o.team = o.pkey and q3o.quarter = 3 and q3o.week = g.week
     left outer join score q4o on q4o.team = o.pkey and q4o.quarter = 4 and q4o.week = g.week
UNION
SELECT g.week       'week'
     , upper(c.tag) 'conference'
     , d.name       'division'
     , t.name       'team'
     , 'No'      as 'at_home'
     , o.name       'oponent'
     , q1t.amount   'q1_for'
     , q2t.amount   'q2_for'
     , q3t.amount   'q3_for'
     , q4t.amount   'q4_for'
     , q1o.amount   'q1_against'
     , q2o.amount   'q2_against'
     , q3o.amount   'q3_against'
     , q4o.amount   'q4_against'
     , (q1t.amount - q1o.amount) 'q1_net'
     , (q2t.amount - q2o.amount) 'q2_net'
     , (q3t.amount - q3o.amount) 'q3_net'
     , (q4t.amount - q4o.amount) 'q4_net'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount) 'game_for'
     , (q1o.amount + q2o.amount + q3o.amount + q4o.amount) 'game_against'
     , (q1t.amount + q2t.amount + q3t.amount + q4t.amount) - (q1o.amount + q2o.amount + q3o.amount + q4o.amount)
       'game_net'
     , if ( (q1t.amount + q2t.amount + q3t.amount + q4t.amount) > (q1o.amount + q2o.amount + q3o.amount + q4o.amount)
          , 1
          , 0
          ) 'won_game'
FROM game g
     inner join team t on g.away = t.pkey
     inner join team o on g.home = o.pkey
     inner join division d on t.dvsn = d.pkey
     inner join conference c on d.conf = c.pkey
     left outer join score q1t on q1t.team = t.pkey and q1t.quarter = 1 and q1t.week = g.week
     left outer join score q2t on q2t.team = t.pkey and q2t.quarter = 2 and q2t.week = g.week
     left outer join score q3t on q3t.team = t.pkey and q3t.quarter = 3 and q3t.week = g.week
     left outer join score q4t on q4t.team = t.pkey and q4t.quarter = 4 and q4t.week = g.week
     left outer join score q1o on q1o.team = o.pkey and q1o.quarter = 1 and q1o.week = g.week
     left outer join score q2o on q2o.team = o.pkey and q2o.quarter = 2 and q2o.week = g.week
     left outer join score q3o on q3o.team = o.pkey and q3o.quarter = 3 and q3o.week = g.week
     left outer join score q4o on q4o.team = o.pkey and q4o.quarter = 4 and q4o.week = g.week
;


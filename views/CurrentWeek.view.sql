CREATE OR REPLACE VIEW CurrentWeek
AS
SELECT team                    as guest
     , game_for                as away_score
     , if (won_game, '*', ' ') as away_won
     , if (won_game, ' ', '*') as home_won
     , game_against            as home_score
     , opponent                 as host
FROM Record
WHERE week = (SELECT int_val FROM settings WHERE name = 'current_week')
AND   at_home = 'N'
ORDER BY team
;

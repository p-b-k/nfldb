CREATE OR REPLACE VIEW Schedule
AS
SELECT week
     , team
     , oponent versus
     , if(at_home = 1, 'Yes', '') 'at_home'
     , if(in_conference = 1, '', 'Yes') 'inter_conference'
     , if(in_division = 1, 'Yes', '') 'in_division'
     , if(won_game is null, 'TBD', if(won_game = 1, 'Yes', '')) won_game
     , if(lost_game is null, 'TBD', if(lost_game = 1, 'Yes', '')) lost_game
     , if(game_for IS NULL, '', CONVERT(game_for, char)) pts_for
     , if(game_against IS NULL, '', CONVERT(game_against, char)) pts_against
FROM Record
UNION
SELECT              week week
     ,              team team
     , '(( BYE ))'  versus
     , ''           at_home
     , ''           inter_conference
     , ''           in_division
     , '***'        won_game
     , '***'        lost_game
     , '***'        pts_for
     , '***'        pts_against
FROM Byes
ORDER BY week
;

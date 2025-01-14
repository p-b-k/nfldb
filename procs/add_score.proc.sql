delimiter // -- Set the delimniter so we can use; withing it being interpreted as a statement

CREATE PROCEDURE add_score
( IN season_yr    INT
( IN week_no      INT
, IN team_name    CHAR (128)
, IN q1           INT
, IN q2           INT
, IN q3           INT
, IN q4           INT
)
BEGIN
  DECLARE team_id INT;
  DECLARE game_id INT;

  SELECT pkey INTO team_id FROM team WHERE name = team_name;

  SELECT g.pkey INTO game_id FROM game g
                INNER JOIN team h ON h.pkey = g.home
                INNER JOIN team a ON a.pkey = g.away
                WHERE g.season = season_yr AND g.week = week_no AND team_name IN (h.name, a.name);

  INSERT INTO score (game, team, quarter, amount) values ( game_id, team_id, 1, q1);
  INSERT INTO score (game, team, quarter, amount) values ( game_id, team_id, 2, q2);
  INSERT INTO score (game, team, quarter, amount) values ( game_id, team_id, 3, q3);
  INSERT INTO score (game, team, quarter, amount) values ( game_id, team_id, 4, q4);
END;
//

delimiter ;

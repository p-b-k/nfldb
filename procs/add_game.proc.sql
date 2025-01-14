delimiter // -- Set the delimniter so we can use; withing it being interpreted as a statement

CREATE OR REPLACE PROCEDURE add_game
( IN season       INT
, IN week_no      INT
, IN away_name    CHAR (128)
, IN home_name    CHAR (128)
)
BEGIN
  DECLARE away_id INT;
  DECLARE home_id INT;

  SELECT pkey INTO away_id FROM team WHERE name = away_name;
  SELECT pkey INTO home_id FROM team WHERE name = home_name;

  INSERT INTO game (season, week, away, home) VALUES (season, week_no, away_id, home_id);
END;
//

delimiter ;


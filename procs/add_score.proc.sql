delimiter // -- Set the delimniter so we can use; withing it being interpreted as a statement

CREATE PROCEDURE add_score
( IN week_no      INT
, IN team_name    CHAR (128)
, IN q1           INT
, IN q2           INT
, IN q3           INT
, IN q4           INT
)
BEGIN
  INSERT INTO score (week, team, quarter, amount)
              values (week_no, (select pkey from team where name = team_name), 1, q1);
  INSERT INTO score (week, team, quarter, amount)
              values (week_no, (select pkey from team where name = team_name), 2, q2);
  INSERT INTO score (week, team, quarter, amount)
              values (week_no, (select pkey from team where name = team_name), 3, q3);
  INSERT INTO score (week, team, quarter, amount)
              values (week_no, (select pkey from team where name = team_name), 4, q4);
END;
//

delimiter ;

delimiter // -- Set the delimniter so we can use; withing it being interpreted as a statement

CREATE PROCEDURE add_overtime
( IN week_no      INT
, IN team_name    CHAR (128)
, IN ot_amount    INT
)
BEGIN
  INSERT INTO score (game, team, quarter, amount)
              values ( (select pkey from game g where (select pkey
                                                       from team
                                                       where week = week_no
                                                       and name = team_name) in (g.home, g.away))
                     , (select pkey from team where name = team_name)
                     , 5
                     , ot_amount
                     );
END;
//

delimiter ;


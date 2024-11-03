delimiter // -- Set the delimniter so we can use; withing it being interpreted as a statement

CREATE OR REPLACE PROCEDURE recreate_team_view (IN team_name CHAR (128))
BEGIN
  EXECUTE IMMEDIATE
    CONCAT('CREATE OR REPLACE VIEW Sched',team_name,' AS SELECT * FROM Schedule WHERE team = ''',team_name,'''');
END;
//

CREATE OR REPLACE PROCEDURE refresh_teams ( )
BEGIN
  DECLARE team_name CHAR (128);

  FOR team_name IN (SELECT name FROM team) DO
    call recreate_team_view (team_name.name);
  END FOR;
END;
//

delimiter ;


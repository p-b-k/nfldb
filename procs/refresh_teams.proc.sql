delimiter // -- Set the delimniter so we can use; withing it being interpreted as a statement

CREATE OR REPLACE PROCEDURE recreate_team_views (IN team_name CHAR (128))
BEGIN
  EXECUTE IMMEDIATE
    CONCAT('CREATE OR REPLACE VIEW Sched',team_name,' AS SELECT * FROM Schedule WHERE team = ''',team_name,'''');

  EXECUTE IMMEDIATE
    CONCAT( 'CREATE OR REPLACE VIEW SoFar', team_name, ' AS '
          , 'SELECT * FROM Schedule WHERE team = ''', team_name, ''' '
          , 'AND week <= (SELECT int_val FROM settings WHERE name = ''current_week'') '
          , 'AND season = (SELECT int_val FROM settings WHERE name = ''current_season'')');
END;
//

CREATE OR REPLACE PROCEDURE refresh_teams ( )
BEGIN
  DECLARE team_name CHAR (128);

  FOR team_name IN (SELECT name FROM team) DO
    call recreate_team_views (team_name.name);
  END FOR;
END;
//

delimiter ;


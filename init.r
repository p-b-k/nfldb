########################################################################################################################
# Open a connection to the NFL database 
########################################################################################################################

get.nfl.connection <- function () {
  library(MASS)
  library(RMySQL)
  dbConnect( dbDriver("MySQL")
           , dbname = "nfl"
           , user   = "access"
           )
}

get.team.record <- function (conn, name, through) {
  fields <- paste( "week, oponent, at_home, "
                 , "in_conference, in_division, won_game, "
                 , "game_for, game_against, q1_for, q1_against, "
                 , "q2_for, q2_against, q3_for, q3_against, q4_for, q4_against, ot_for, ot_against"
                 )
  query <- paste( "SELECT "
                , fields
                , " FROM Record WHERE team = '"
                , name
                , "' AND week <= "
                , through
                , " ORDER BY week"
                , sep=""
                )
  dbGetQuery(conn, query)
}

get.div.record <- function (conn, cname, dname, through) {
  fields <- paste( "team, oponent, at_home, game_for, game_against, q1_for, q1_against, "
                 , "q2_for, q2_against, q3_for, q3_against, q4_for, q4_against, ot_for, ot_against"
                 )
  query <- paste( "SELECT "
                , fields
                , " FROM Record"
                , " WHERE UPPER(team_division) = UPPER('" , dname , "')"
                , " AND team_conference = UPPER('" , cname , "')"
                , " AND week <= " , through
                , " ORDER BY week"
                , sep=""
                )
  dbGetQuery(conn, query)
}

get.nfl.stats <- function (conn) {
  fields <- paste( "conference, division, team, played, pts_for, pts_against, "
                 , "win, lose, pct, pct_conf, pct_div"
                 )
  query <- paste( "SELECT "
                , fields
                , " FROM Stats"
                , sep=""
                )
  dbGetQuery(conn, query)
}


nfl.teams <- c( "Bills", "Dolphins", "Patriots", "Jets"
              , "Ravens", "Bengals", "Browns", "Steelers"
              , "Texans", "Colts", "Jaguars", "Titans"
              , "Broncos", "Chiefs", "Raiders", "Chargers"
              
              , "Eagles", "Giants", "Cowboys", "Commanders"
              , "Bears", "Lions", "Packers", "Vikings"
              , "Buccaneers", "Falcons", "Saints", "Panthers"
              , "Cardinals", "Rams", "49ers", "Seahawks"
              )

conn <- get.nfl.connection ()

T.Bills          = get.team.record(conn, "Bills", 8)
T.Dolphins       = get.team.record(conn, "Dolphins", 8)
T.Patriots       = get.team.record(conn, "Patriots", 8)
T.Jets           = get.team.record(conn, "Jets", 8)
T.Ravens         = get.team.record(conn, "Ravens", 8)
T.Bengals        = get.team.record(conn, "Bengals", 8)
T.Browns         = get.team.record(conn, "Browns", 8)
T.Steelers       = get.team.record(conn, "Steelers", 8)
T.Texans         = get.team.record(conn, "Texans", 8)
T.Colts          = get.team.record(conn, "Colts", 8)
T.Jaguars        = get.team.record(conn, "Jaguars", 8)
T.Titans         = get.team.record(conn, "Titans", 8)
T.Broncos        = get.team.record(conn, "Broncos", 8)
T.Chiefs         = get.team.record(conn, "Chiefs", 8)
T.Raiders        = get.team.record(conn, "Raiders", 8)
T.Chargers       = get.team.record(conn, "Chargers", 8)
T.Eagles         = get.team.record(conn, "Eagles", 8)
T.Giants         = get.team.record(conn, "Giants", 8)
T.Cowboys        = get.team.record(conn, "Cowboys", 8)
T.Commanders     = get.team.record(conn, "Commanders", 8)
T.Bears          = get.team.record(conn, "Bears", 8)
T.Lions          = get.team.record(conn, "Lions", 8)
T.Packers        = get.team.record(conn, "Packers", 8)
T.Vikings        = get.team.record(conn, "Vikings", 8)
T.Buccaneers     = get.team.record(conn, "Buccaneers", 8)
T.Falcons        = get.team.record(conn, "Falcons", 8)
T.Saints         = get.team.record(conn, "Saints", 8)
T.Panthers       = get.team.record(conn, "Panthers", 8)
T.Cardinals      = get.team.record(conn, "Cardinals", 8)
T.Rams           = get.team.record(conn, "Rams", 8)
T.49ers          = get.team.record(conn, "49ers", 8)
T.Seahawks       = get.team.record(conn, "Seahawks", 8)

D.afc.e          = get.div.record(conn, 'afc', 'east', 8)
D.afc.w          = get.div.record(conn, 'afc', 'west', 8)
D.afc.n          = get.div.record(conn, 'afc', 'north', 8)
D.afc.s          = get.div.record(conn, 'afc', 'south', 8)
D.nfc.e          = get.div.record(conn, 'nfc', 'east', 8)
D.nfc.w          = get.div.record(conn, 'nfc', 'west', 8)
D.nfc.n          = get.div.record(conn, 'nfc', 'north', 8)
D.nfc.s          = get.div.record(conn, 'nfc', 'south', 8)

NFL.stats        = get.nfl.stats(conn)

dbDisconnect(conn)
rm("conn")

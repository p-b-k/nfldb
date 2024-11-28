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

########################################################################################################################
# Define Data Retrieval Functions
########################################################################################################################

get.view <- function (conn, view, sort) {
  query <- paste( "SELECT * FROM "
                , view
                , " WHERE week <= (SELECT int_val FROM settings WHERE name = 'current_week')"
                , " ORDER BY "
                , sort
                )
  dbGetQuery(conn, query)
}

get.team.record <- function (conn, name) {
  fields <- paste( "week, oponent, at_home, "
                 , "in_conference, in_division, won_game, "
                 , "game_for, game_against, q1_for, q1_against, "
                 , "q2_for, q2_against, q3_for, q3_against, q4_for, q4_against, ot_for, ot_against"
                 )
  query <- paste( "SELECT "
                , fields
                , " FROM Record WHERE team = '"
                , name
                , "' AND week <= (SELECT int_val FROM settings WHERE name = 'current_week')"
                , " ORDER BY week"
                , sep=""
                )
  dbGetQuery(conn, query)
}

get.div.record <- function (conn, cname, dname) {
  fields <- paste( "week, team, oponent, at_home, game_for, game_against, won_game, lost_game, "
                 , "q1_for, q1_against, q2_for, q2_against, q3_for, q3_against, q4_for, q4_against, "
                 , "ot_for, ot_against"
                 )
  query <- paste( "SELECT "
                , fields
                , " FROM Record"
                , " WHERE UPPER(team_division) = UPPER('" , dname , "')"
                , " AND team_conference = UPPER('" , cname , "')"
                , " AND week <= (SELECT int_val FROM settings WHERE name = 'current_week')"
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

# Get Stringth of Schedule view
get.nfl.sos <- function (conn) {
  fields <- paste( "conference, division, team, "
                 , "strength, pct, owins, oloses, oratio, weighted"
                 )
  query <- paste( "SELECT"
                , fields
                , "FROM StrengthOfSched"
                )
  dbGetQuery(conn, query)
}

# List of all NFL teams
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

T.Bills          <- get.team.record(conn, "Bills")
T.Dolphins       <- get.team.record(conn, "Dolphins")
T.Patriots       <- get.team.record(conn, "Patriots")
T.Jets           <- get.team.record(conn, "Jets")
T.Ravens         <- get.team.record(conn, "Ravens")
T.Bengals        <- get.team.record(conn, "Bengals")
T.Browns         <- get.team.record(conn, "Browns")
T.Steelers       <- get.team.record(conn, "Steelers")
T.Texans         <- get.team.record(conn, "Texans")
T.Colts          <- get.team.record(conn, "Colts")
T.Jaguars        <- get.team.record(conn, "Jaguars")
T.Titans         <- get.team.record(conn, "Titans")
T.Broncos        <- get.team.record(conn, "Broncos")
T.Chiefs         <- get.team.record(conn, "Chiefs")
T.Raiders        <- get.team.record(conn, "Raiders")
T.Chargers       <- get.team.record(conn, "Chargers")
T.Eagles         <- get.team.record(conn, "Eagles")
T.Giants         <- get.team.record(conn, "Giants")
T.Cowboys        <- get.team.record(conn, "Cowboys")
T.Commanders     <- get.team.record(conn, "Commanders")
T.Bears          <- get.team.record(conn, "Bears")
T.Lions          <- get.team.record(conn, "Lions")
T.Packers        <- get.team.record(conn, "Packers")
T.Vikings        <- get.team.record(conn, "Vikings")
T.Buccaneers     <- get.team.record(conn, "Buccaneers")
T.Falcons        <- get.team.record(conn, "Falcons")
T.Saints         <- get.team.record(conn, "Saints")
T.Panthers       <- get.team.record(conn, "Panthers")
T.Cardinals      <- get.team.record(conn, "Cardinals")
T.Rams           <- get.team.record(conn, "Rams")
T.49ers          <- get.team.record(conn, "49ers")
T.Seahawks       <- get.team.record(conn, "Seahawks")

D.afc.e          <- get.div.record(conn, 'afc', 'east')
D.afc.w          <- get.div.record(conn, 'afc', 'west')
D.afc.n          <- get.div.record(conn, 'afc', 'north')
D.afc.s          <- get.div.record(conn, 'afc', 'south')
D.nfc.e          <- get.div.record(conn, 'nfc', 'east')
D.nfc.w          <- get.div.record(conn, 'nfc', 'west')
D.nfc.n          <- get.div.record(conn, 'nfc', 'north')
D.nfc.s          <- get.div.record(conn, 'nfc', 'south')

suppressWarnings({
NFL.stats        <- get.nfl.stats(conn)
NFL.sos          <- get.nfl.sos(conn)
NFL.record       <- get.view(conn, "Record", "week")
})


dbDisconnect(conn)
rm("conn")

########################################################################################################################
# Open a connection to the NFL database 
########################################################################################################################

defc <- c( rgb( 0.80, 0.30, 0.20, 0.80)
         , rgb( 0.30, 0.60, 0.20, 0.80)
         , rgb( 0.80, 0.70, 0.30, 0.80)
         , rgb( 0.40, 0.40, 0.80, 0.88)
         )

plot.div.pts <- function(d, colors = defc) boxplot(split(d$game_for - d$game_against, d$team), col=colors)

through.week <- function (week) {
  wins <- by(NFL.record[1:week, c("won_game")], NFL.record$team, sum)
  games <- by(NFL.record[1:week, c("won_game", "lost_game")], NFL.record$team, sum)
  wins / games
}

game.data <- function (team, week) {
  G <- team[team$week == week, ]
  attach(G)
  Frame <- data.frame( q.for     = c( q1_for, q2_for, q3_for, q4_for )
                     , q.against = c( q1_against, q2_against, q3_against, q4_against )
                     , c.diff    = c( q1_for - q1_against
                                    , (q1_for + q2_for) - (q1_against + q2_against)
                                    , (q1_for + q2_for + q3_for) - (q1_against + q2_against + q3_against)
                                    , (q1_for + q2_for + q3_for + q4_for)
                                      -
                                      (q1_against + q2_against + q3_against + q4_against)
                                    )
                     )
  detach()
  Frame
}

reset.width <- function () {options("width" = as.numeric(Sys.getenv ("COLUMNS")))}


########################################################################################################################
# Open a connection to the NFL database 
########################################################################################################################

defc <- c( rgb( 0.80, 0.30, 0.20, 0.80)
         , rgb( 0.30, 0.60, 0.20, 0.80)
         , rgb( 0.80, 0.70, 0.30, 0.80)
         , rgb( 0.40, 0.40, 0.80, 0.88)
         )

plot.div.pts <- function(d, colors = defc) boxplot(split(d$game_for - d$game_against, d$team), col=colors)

# by(NFL.record[, c("won_game")], NFL.record$team, sum) / by(NFL.record[, c("won_game", "lost_game")], NFL.record$team, sum)

through.week <- function (week) {
  wins <- by(NFL.record[1:week, c("won_game")], NFL.record$team, sum)
  games <- by(NFL.record[1:week, c("won_game", "lost_game")], NFL.record$team, sum)
  wins / games
}


########################################################################################################################
# Various graph definitions
########################################################################################################################

library (ggplot2)
library (hrbrthemes)

## *********************************************************************************************************************
## Plot a graph of differences in two values, showing an adjustment
## *********************************************************************************************************************

display_span_graph <- function (data) {
  names(data) <- c("x", "value1", "value2")

  value1.color <- rgb(0.5, 0.8, 0, 1)
  value2.color <- rgb(0.8, 0, 0.5, 1)

  ggplot(data) +
  geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="grey") +
  geom_point( aes(x=x, y=value1), color=value1.color, size=3 ) +
  geom_point( aes(x=x, y=value2), color=value2.color, size=3 ) +
  coord_flip()+
# theme_ipsum() +
# theme(
#   legend.position = "bottom",
# ) +
  xlab("Teams") +
  ylab("Pct VS Weighted Pct")
}

## *********************************************************************************************************************
## Plot the difference between win pct and weighted win pct
## *********************************************************************************************************************

show.sos <- function () {
  data <- data.frame(team=NFL.sos$team, v1=NFL.sos$pct, v1=NFL.sos$oratio)

  display_span_graph (data)
}

## *********************************************************************************************************************
## Most basic bar graph examples
## See: https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html
## *********************************************************************************************************************

# Create data
pbk.demo.bar.data <- data.frame ( name  = c("A","B","C","D","E")
                                , value = c(3,12,5,18,45)
                                )


pbk.demo.bar.basic <- function () {
  # Barplot
  ggplot( pbk.demo.bar.data
        , aes(x=name, y=value)
        ) + geom_bar(stat = "identity")
}

pbk.demo.bar.basic.colored <- function () {
  # Barplot
  ggplot( pbk.demo.bar.data
        , aes(x=name, y=value)
        ) + geom_bar( stat = "identity"
                    , color = "blue"
                    , fill = rgb(0.0, 0.47, 0.23, 0.20)
                    )
}

## *********************************************************************************************************************
## Stacking barchart
## See: https://r-graph-gallery.com/48-grouped-barplot-with-ggplot2.html`
## *********************************************************************************************************************

pbk.demo.bar.stacked <- function () {
  # create a dataset
  
  # @ elem defines a stack of bars, with a name and a number of the stack
  specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
  # so for our purposes: c(rep("Q1", 2), rep("Q2", 2), rep("Q3", 2), rep("Q4", 2))
  # Or, if there's overtime,  c(rep("Q1", 2), rep("Q2", 2), rep("Q3", 2), rep("Q4", 2), rep("OT", 2))
  quarters <- c(rep("Q1" , 2) , rep("Q2" , 2) , rep("Q3" , 2) , rep("Q4" , 2) )

  # @ elemn defines the name of one of the stacks
  condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
  # for our purposes: rep(c("Eagles", "Steelers"), 4) or, if there's overtime, rep(c("Eagles", "Steelers"), 5)
  teams <- rep(c("Eagles" , "Panthers") , 4)
  
  # 3 x 4, or 12, random values between 0 and 15, to represent the data to be graphed
  value <- abs(rnorm(12 , 0 , 15))
  # for our purposes it will be the scores, somehow arranged to match with the values
  scores <- c(0, -3, 14, -7, 0, -6, 8, 0)

  # Create a data frame with the 3, 12 element arrays
  demo.data <- data.frame(specie,condition,value)
  # for our purposes we'll do much the same
  game.data <- data.frame(quarters, teams, scores)
   
  # Stacked
  # ggplot(game.data, aes( fill=condition
  #                      , y=value
  #                      , x=specie
  #                      )
  #       ) + geom_bar(position="stack", stat="identity")

  ggplot(game.data, aes( fill=teams
                       , y=scores
                       , x=quarters
                       )
        ) + geom_bar(position="stack", stat="identity")
}

# show.game.data <- function (data) {
#   
# }


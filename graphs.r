########################################################################################################################
# Various graph definitions
########################################################################################################################

library (ggplot2)
library (hrbrthemes)

## *********************************************************************************************************************
## Plot a graph of differences in two values, showing an adjustment
## *********************************************************************************************************************

display_span_graph <- function (Data) {
  names(data) <- c("x", "value1", "value2")

  value1.color <- rgb(0.5, 0.8, 0, 1)
  value2.color <- rgb(0.8, 0, 0.5, 1)

  ggplot(data) +
  geom_segment( aes(x=x, xend=x, y=value1, yend=value2), color="grey") +
  geom_point( aes(x=x, y=value1), color=value1.color, size=3 ) +
  geom_point( aes(x=x, y=value2), color=value2.color, size=3 ) +
  coord_flip()+
  theme_ipsum() +
  theme(
    legend.position = "bottom",
  ) +
  xlab("Teams") +
  ylab("Pct VS Weighted Pct")
}

## *********************************************************************************************************************
## Plot the difference between win pct and weighted win pct
## *********************************************************************************************************************

show_sos <- function () {
  data <- data.frame(team=D.nfc.e$team, 3, 4)

  display_span_graph (data)
}


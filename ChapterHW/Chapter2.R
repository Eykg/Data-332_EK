library(ggplot2)

x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)


qplot(x3, binwidth = 1)

replicate(3, 1 + 1)

replicate(10, roll())

roll <- function() {
  die <- 1:6
  prob <- c(rep(1/8, 5), 3/8)
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}


rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

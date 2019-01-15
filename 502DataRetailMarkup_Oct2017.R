library(ggplot2)
library(dplyr)

# This data lists, product category, the wholesale and retail price for various products by Wholesaler

from_topshelf <-
  read.csv("~/R/Learning_R_Project/RetailMarkupOct2017Data.csv", header = TRUE)

# Create a Numeric instead of string list for the Markup to do statistics on it
from_topshelf$Avg.Markup.With.Tax.Numeric <- round(from_topshelf$Avg.Retail.Price.With.Tax / from_topshelf$Avg.Wholesale.Price,1)

summary(from_topshelf)


# Will be using the information calculated in the boxplot later so I first save it
x <-
  boxplot(
    Avg.Markup.With.Tax.Numeric ~ Category,
    data = from_topshelf,
    main = "Boxplots by Category",
    xlab = "Category",
    ylab = "Markup Amt",
    col = "orange",
    border = "black",
    range = 2,
    axes = FALSE
  )

# Plot it but without outliers or axes and I show them later in a easier to see way
boxplot(
  Avg.Markup.With.Tax.Numeric ~ Category,
  data = from_topshelf,
  main = "Boxplots by Category - Oct 2017",
  xlab = "Category",
  ylab = "Markup Amt",
  col = "orange",
  border = "black",
  range = 2,
  outline = FALSE,
  # To remove the outliers from being shown and throwing the visual off
  axes = FALSE
)

axis(side = 2, at = seq(0, 5, 0.25)) # Y-Axis
axis(side = 1, at = 1:length(x$stats[1,]), x$names, las = 2
) # X-Axis

abline(h = summary(x$stats[3, ])[3]) # This is a line for the Median of all medians per product
abline(h = summary(x$stats[3, ])[1], lty = 2) # the Minimum of all medians
abline(h = summary(x$stats[3, ])[6], lty = 2) # the maximum of all medians


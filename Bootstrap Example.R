library(boot)
library(ggplot2)

# This data lists, by number of week, the number of Submits and Leads for just GCU

GCUData <- read.csv("~/R/Learning_R_Project/GCUSubmitLeadSEOByWeek.csv", header = TRUE)

# Trying my hand at a 'Statistic Function' to use in the bootstrap function.
# Basically, I want to determine the Sum of Leads / Sum of Submits to get a
# Submission -> Lead rate for this sample

testFunc <- function(data, indicies) {
  sum(data[indicies,3])/sum(data[indicies,2])
}

boot(data = GCUData, statistic = testFunc, R = 1000, stype = "i")

# Based on reading, trying a manual way to see the histogram of the various
# Submission to Lead conversion rates because I couldn't figure it out using the
# boot package :-)



# First, do one resample and see the results: (note that I removed the week number in the resulting list)
n <- nrow(GCUData)
manual_resample <- GCUData[sample(c(1:nrow(GCUData)), replace = TRUE),2:3]
nrow(manual_resample)

manual_statistic <- sum(manual_resample[2])/sum(manual_resample[1])
manual_statistic

# Now lets do this many times!
repeat_times <- 1000
list_manual_statistics <- c()
for (i in 1:repeat_times) {
  manual_resample <- GCUData[sample(c(1:n), replace = TRUE),2:3]
  sample_avg <- sum(manual_resample$TotLeads) / sum(manual_resample$PaidSubmits)
  list_manual_statistics <- c(list_manual_statistics,sample_avg)
}

#nrow(manual_resample)

summary(list_manual_statistics)
hist(list_manual_statistics)
mean(list_manual_statistics)
median(list_manual_statistics)
sd(list_manual_statistics)


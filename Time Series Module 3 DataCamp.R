# VIDEO ON Scatter Plots
#
# Asset prices vs. asset returns
#
# The goal of investing is to make a profit. The revenue or loss from investing
# depends on the amount invested and changes in prices, and high revenue
# relative to the size of an investment is of central interest. This is what
# financial asset returns measure, changes in price as a fraction of the initial
# price over a given time horizon, for example, one business day.
#
# Let's again consider the eu_stocks dataset. This dataset reports index values,
# which we can regard as prices. The indices are not investable assets
# themselves, but there are many investable financial assets that closely track
# major market indices, including mutual funds and exchange traded funds.
#
# Log returns, also called continuously compounded returns, are also commonly
# used in financial time series analysis. They are the log of gross returns, or
# equivalently, the changes (or first differences) in the logarithm of prices.
#
# The change in appearance between daily prices and daily returns is typically
# substantial, while the difference between daily returns and log returns is
# usually small. As you'll see later, one advantage of using log returns is that
# calculating multi-period returns from individual periods is greatly simplified
# - you just add them together!
#
# In this exercise, you'll further explore the eu_stocks dataset, including
# plotting prices, converting prices to (net) returns, and converting prices to
# log returns. 
#
# Instructions 100 XP
#
# Use plot() to generate a plot of the eu_stocks data. Use the pre-written code
# to convert daily prices in the eu_stocks data to daily net returns. Use ts()
# to convert returns to a ts object. Set the start argument equal to c(1991,
# 130) and set the frequency argument equal to 260. Use another call to plot()
# to view daily net returns. Use the pre-written code combining diff() and log()
# to generate logreturns. Use a final call to plot() to view daily log returns.
# 

#************************ ADDED BELOW TO GET INFORMATION IN ***************
EuStockReturnsCSV <- read.csv("~/R/Learning_R_Project/EuStockReturnsCSV.csv")
eu_stocks <- ts(EuStockReturnsCSV[,2:5], start = c(1991, 130), frequency = 260)
#***************************************************************************

# Plot eu_stocks
plot(eu_stocks)

# Use this code to convert prices to returns
returns <- eu_stocks[-1,] / eu_stocks[-1860,] - 1

# Convert returns to ts
returns <- ts(returns, start = c(1991, 130), frequency = 260)

# Plot returns
plot(returns)

# Use this code to convert prices to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)


# Characteristics of financial time series
#
# Daily financial asset returns typically share many characteristics. Returns
# over one day are typically small, and their average is close to zero. At the
# same time, their variances and standard deviations can be relatively large.
# Over the course of a few years, several very large returns (in magnitude) are
# typically observed. These relative outliers happen on only a handful of days,
# but they account for the most substantial movements in asset prices. Because
# of these extreme returns, the distribution of daily asset returns is not
# normal, but heavy-tailed, and sometimes skewed. In general, individual stock
# returns typically have even greater variability and more extreme observations
# than index returns.
#
# In this exercise, you'll work with the eu_percentreturns dataset, which is the
# percentage returns calculated from your eu_stocks data. For each of the four
# indices contained in your data, you'll calculate the sample mean, variance,
# and standard deviation.
#
# Notice that the average daily return is about 0, while the standard deviation
# is about 1 percentage point. Also apply the hist() and qqnorm() functions to
# make histograms and normal quantile plots, respectively, for each of the
# indices. 
#
# Instructions 100 XP
#
# Use colMeans() to calculate the sample mean for each column in your
# eu_percentreturns data. Use apply() to calculate the sample variance for each
# index. Leave the MARGIN argument at 2 and set the FUN argument to var. Use
# another call to apply() to calculate the standard deviation for each index.
# Keep the MARGIN argument at 2 but this time set the FUN argument to sd. Use a
# third call to apply() to display a histogram of percent returns for each
# index. Use a final call to apply() to display normal quantile plots for each
# index.
# 

#************************ ADDED BELOW TO GET INFORMATION IN ***************
eu_percentreturns <- read.csv("~/R/Learning_R_Project/EU_Percentage_Returns.csv")
eu_percentreturns <- ts(eu_percentreturns, start = c(1991, 130), frequency = 260)
#***************************************************************************

# Generate means from eu_percentreturns
colMeans(eu_percentreturns)

# Use apply to calculate sample variance from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = var)

# Use apply to calculate standard deviation from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = sd)

# Display a histogram of percent returns for each index
par(mfrow = c(2,2))
apply(eu_percentreturns, MARGIN = 2, FUN = hist, main = "", xlab = "Percentage Return")

# Display normal quantile plots of percent returns for each index
par(mfrow = c(2,2))
apply(eu_percentreturns, MARGIN = 2, FUN = qqnorm, main = "")
qqline(eu_percentreturns)


# Plotting pairs of data
#
# Time series data is often presented in a time series plot. For example, the
# index values from the eu_stocks dataset are shown in the adjoining figure.
# Recall, eu_stocks contains daily closing prices from 1991-1998 for the major
# stock indices in Germany (DAX), Switzerland (SMI), France (CAC), and the UK
# (FTSE).
#
# It is also useful to examine the bivariate relationship between pairs of time
# series. In this exercise we will consider the contemporaneous relationship,
# that is matching observations that occur at the same time, between pairs of
# index values as well as their log returns. The plot(a, b) function will
# produce a scatterplot when two time series names a and b are given as input.
#
# To simultaneously make scatterplots for all pairs of several assets the
# pairs() function can be applied to produce a scatterplot matrix. When shared
# time trends are present in prices or index values it is common to instead
# compare their returns or log returns.
#
# In this exercise, you'll practice these skills on the eu_stocks data. Because
# the DAX and FTSE returns have similar time coverage, you can easily make a
# scatterplot of these indices. Note that the normal distribution has elliptical
# contours of equal probability, and pairs of data drawn from the multivariate
# normal distribution form a roughly elliptically shaped point cloud. Do any of
# the pairs in the scatterplot matrices exhibit this pattern, before or after
# log transformation? 
#
# Instructions 100 XP
#
# Use plot() to make a scatterplot of DAX and FTSE. Use pairs() to make a
# scatterplot matrix of the four indices in eu_stocks. Generate logreturns from
# eu_stocks using diff(log(___)). Use another call to plot() to generate a
# simple time series plot of logreturns. Use another call to pairs() to generate
# a scatterplot matrix for logreturns.
# 

# Make a scatterplot of DAX and FTSE
plot(eu_stocks[,"DAX"],eu_stocks[,"FTSE"])


# Make a scatterplot matrix of eu_stocks
pairs(eu_stocks)

# Convert eu_stocks to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)

# Make a scatterplot matrix of logreturns
pairs(logreturns)



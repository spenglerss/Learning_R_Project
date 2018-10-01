# Data Camp Exmples - Time Series

#-------- SECTION FOR WHITE NOISE MODELS

# Random Walk Models

# Generate a RW model using arima.sim
random_walk <- arima.sim(model = list(order = c(0,1,0)), n = 100)

# Plot random_walk
ts.plot(random_walk)

# Calculate the first difference series
random_walk_diff <- diff(random_walk) 

# Plot random_walk_diff
ts.plot(random_walk_diff)

#
# Simulate the random walk model with a drift
#
# A random walk (RW) need not wander about zero, it can have an upward or
# downward trajectory, i.e., a drift or time trend. This is done by including an
# intercept in the RW model, which corresponds to the slope of the RW time
# trend.
#
# For an alternative formulation, you can take the cumulative sum of a constant
# mean white noise (WN) series, such that the mean corresponds to the slope of
# the RW time trend.
#
# To simulate data from the RW model with a drift you again use the arima.sim()
# function with the model = list(order = c(0, 1, 0)) argument. This time, you
# should add the additional argument mean = ... to specify the drift variable,
# or the intercept.
#
# Instructions 100 XP
#
# Use arima.sim() to generate another RW model. Set the model argument equal to
# list(order = c(0, 1, 0)) to generate a RW-type model and set n equal to 100 to
# produce 100 observations. Set the mean argument to 1 to produce a drift. Save
# this to rw_drift. Use ts.plot() to plot your rw_drift data. Use diff() to
# calculate the first difference of your rw_drift data. Save this as
# rw_drift_diff. Use another call to ts.plot() to plot rw_drift_diff.
# 

# Generate a RW model with a drift uing arima.sim
rw_drift <- arima.sim(model = list(order = c (0,1,0)), n = 100, mean = 1)

# Plot rw_drift
ts.plot(rw_drift)

# Calculate the first difference series
rw_drift_diff <- diff(rw_drift) 

# Plot rw_drift_diff
ts.plot(rw_drift_diff)




# Estimate the random walk model
#
# For a given time series y we can fit the random walk model with a drift by
# first differencing the data, then fitting the white noise (WN) model to the
# differenced data using the arima() command with the order = c(0, 0, 0))
# argument.
#
# The arima() command displays information or output about the fitted model.
# Under the Coefficients: heading is the estimated drift variable, named the
# intercept. Its approximate standard error (or s.e.) is provided directly below
# it. The variance of the WN part of the model is also estimated under the label
# sigma^2.
# 
# Instructions 100 XP
#
# The time series random_walk has already been loaded, and is shown in the
# adjoining figure. Use diff() to generate the first difference of the data.
# Save this to rw_diff. Use ts.plot() to plot your differenced data Use arima()
# to fit the WN model for the differenced data. To do so, set the x argument to
# rw_diff and set the order argument to c(0, 0, 0). Store the model in model_wn.
# Store the intercept value of model_wn in int_wn. You can obtain this value
# using model_wn$coef. Use ts.plot() to reproduce your original plot of
# random_walk. Add the estimated time trend to the adjoining plot with the
# function abline(). You can use int_wn as the second argument.
# 

random_walk <- arima.sim(model = list(order = c (0,1,0)), n = 100, mean = 1)


# Difference your random_walk data
rw_diff <- diff(random_walk)

# Plot rw_diff
ts.plot(rw_diff)

# Now fit the WN model to the differenced data
model_wn <- arima(x = rw_diff, order = c(0,0,0))

# Store the value of the estimated time trend (intercept)
int_wn <- model_wn$coef

# Plot the original random_walk data
ts.plot(random_walk)

# Use abline(0, ...) to add time trend to the figure
abline(ts.plot(random_walk),int_wn) #NOT SURE ABOUT THIS!

# VIDEO ON Stationary Models 

# Are the white noise model or the random walk model stationary?
#
# The white noise (WN) and random walk (RW) models are very closely related.
# However, only the RW is always non-stationary, both with and without a drift
# term. This is a simulation exercise to highlight the differences.
#
# Recall that if we start with a mean zero WN process and compute its running or
# cumulative sum, the result is a RW process. The cumsum() function will make
# this transformation for you. Similarly, if we create a WN process, but change
# its mean from zero, and then compute its cumulative sum, the result is a RW
# process with a drift.
#
# Instructions 100 XP Instructions 100 XP
#
# Use arima.sim() to generate a WN model. Set the model argument equal to
# list(order = c(0, 0, 0)) to generate a WN-type model and set n equal to 100 to
# produce 100 observations. Save this to white_noise. Use the cumsum() function
# on white_noise to quickly convert your WN model to RW data. Save this to
# random_walk. Use a similar call toarima.sim() to generate a second WN model.
# Keep all arguments the same, but this time set the mean argument to 0.4. Save
# this to wn_drift. Use another call to cumsum() to convert your wn_drift data
# to RW. Save this as rw_drift. Enter the pre-written code to plot all four
# series for comparison.
# 

# Use arima.sim() to generate WN data
white_noise <- arima.sim(model = list(order = c(0,0,0)), n = 100)

# Use cumsum() to convert your WN data to RW
random_walk <- cumsum(white_noise)

# Use arima.sim() to generate WN drift data
wn_drift <- arima.sim(model = list(order = c(0,0,0)), n = 100, mean = 0.4)

# Use cumsum() to convert your WN drift data to RW
rw_drift <- cumsum(wn_drift)

# Plot all four data objects
plot.ts(cbind(white_noise, random_walk, wn_drift, rw_drift))


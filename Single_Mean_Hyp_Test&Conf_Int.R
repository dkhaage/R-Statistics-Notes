# Ex03_04
# Single mean: Hypothesis test and confidence interval

# LOAD DATA
?quakes
quakes[1:5,] # See the first 5 lines of the data
mag <- quakes$mag # Just load the magnitude variable
mag[1:5] # Fisrt 5 Lines

# Use t-test for one sample
# Default t-test (compares mean of a hypothesised value to 0)
t.test(mag)

# When there are no 0 values, you can modify the T-test
# One-sided/tailed t-test w/mu = 4
t.test(mag, alternative = 'greater', mu = 4) # see if the mean is greater than 4

rm(list = ls()) # Clean up

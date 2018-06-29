# Calculate the mean, SD, skewness, and kurtosis
# for mpg, hp, and qsec from mtcars

# Load Data
data("mtcars")

# Use the package "psych"
require('psych')
d <- describe(mtcars[c(1,4,7)]) # variables that I want
d
d[,c(3,4,11,12)] # printing the desired columns from analysis

# Clean up
detach('package:psych', unload = TRUE)
rm(list = ls())


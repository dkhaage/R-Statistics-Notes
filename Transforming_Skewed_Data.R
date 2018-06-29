# Ex04_06
# Transforming Skewed Data (By pulling outliers to the center of the distribution)

# Import data
xskew <- read.csv('xskew.csv')
x <- xskew[, 2]
hist(x)

# Square data
x2 <- x^2
hist(x2)
boxplot(x2)

# 4th power
x4 <- x^4
hist(x4)
boxplot(x4)

# Have not lost the outliers, by pulling in the lower values and extending the upper values. 
# Changed the distribution to resemble more of a bell curve
# Sets up for Variable Standard Least Square Analysis without losing any data in the process.

rm(list = ls()) # Cleaning Up

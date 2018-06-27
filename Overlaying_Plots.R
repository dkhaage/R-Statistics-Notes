# Ex02_05
# Overlaying Plots

# LOAD DATASET
require('datasets')
?swiss
swiss
str(swiss)
data(swiss)
fertility <- swiss$Fertility

# PLOTS
# Plot 1: Histogram

h <- hist(fertility,
          prob = TRUE, # Flipside of "freq = FALSE"
          ylim = c(0, 0.04),
          xlim = c(30, 100),
          breaks = 11,
          col = "#E5E5E5",
          border = 0,
          main = "Fertility for 47 French-Speaking\nSwiss Provinces, c. 1888")


# Plot 2: Normal curve (if prob = TRUE) # Density normal curve of the normal distribution 
# Centered on the mean of (fertility), using Standard Deviation of Mean of (fertility)
# Bell Curve

curve(dnorm(x, mean = mean(fertility), sd = sd(fertility)),
      col = 'red',
      lwd = 3, # Thee pixels thick
      add = TRUE) # Add to existing chart.

# Plot 3 & 4: Kernel density lines (if prob = TRUE) # Like a smoothed histogram
lines(density(fertility), col = "blue") # function is lines
lines(density(fertility, adjust = 3), col = "darkgreen")

# Plot 5: Rug (That is, lineplot under histogram)
# Gives indication of every data point, and explains why the lines are as tall as they are
rug(fertility, col = 'red') 

rm(list = ls()) # Clean Up


















# Ex04_03
# Computing composit variables

# Create variable rn1 with 1 million random normal values
# Will vary from one time to another

rn1 <- rnorm(1000000) # Million random normal values
hist(rn1)
summary(rn1)

# Create variable rn2 with 1 million random normal values
rn2 <- rnorm(1000000)
hist(rn2)
summary(rn2)

# Average scores across two variables
rn.mean <- (rn1 + rn2)/2 # R deals with vectors first
hist(rn.mean) 

# Multiply scores across two variables
rn.prod <- rn1*rn2
hist(rn.prod)
summary(rn.prod)

# Kurtosis comparisons, the sharpness of the peak of a frequency-distribution curve 
# (see the presence or absence of outliers)

# The package "moments" gives kurtosis where a 
# mesokurtic, normal distribution has a value of 3. ((of a frequency distribution or its graphical representation) having the same kurtosis as the normal distribution.)

# The package "psych" recenters the kurtosis values
# around 0, which is more commom now.
require('psych')
kurtosi(rn1)
kurtosi(rn2)
kurtosi(rn.mean) # Similar to Cauchy distribution

# Clean up
detach("package:psych", unload = TRUE)
rm(list = ls())

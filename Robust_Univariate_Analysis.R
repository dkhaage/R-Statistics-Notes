# Ex03_06
# Robust statistics for univariate analysis
# Procedures resistant to outliers

# See "A Brief Overview of Robust Statistice" by Olfa Nasaoui, at 
browseURL ("http://j.mp/12YPV5L")

# Or see the CRAN Task View on robust statistics at
browseURL("http://cran.r-project.org/web/views/Robust.html")

# Load Data
?state.area
data(state.area) # Gets error message
area <- state.area # But can save as a vector
area
hist(area)
boxplot(area)
boxplot.stats(area)
summary(area) # Strong positive skew, reason why mean is far from median

# Robust methods for describing center:
mean(area) # NOT robust (If you have outliers it gets distorted tramendously)
median(area)
mean(area, trim = .05) # 5% from each end (10% total), cut off outliers
mean(area, trim = .10) # 10% from each end (20% total)
mean(area, trim = .20) # 20% from each end (40% total)
mean(area, trim = .50) # 50% from each end = median

# Robust methods for describing variation (Spread):
sd(area) # NOT robust. When SD is bigger than Mean shows a problem. SD is basically an average deviation from the mean
mad(area) # Median absolute deviation
IQR(area) # Interquartile range (Can select many methods). 
# Not comparible to median or mean, IQR is an ordinal a statistic
fivenum(area) # Tukey's hinges (similar to quartiles)

rm(list = ls()) # Cleaning Up

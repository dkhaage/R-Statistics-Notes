# Ex04_01 
# Examining outliers - ways to describe and handle

# CATAGORICAL DATA
# Outlier is < 10% of the total sample,
# then normal curve no longer serves as a good approximation.
# Worldwide shipments of smartphone OS
# in millions for 2013 Q1

OS <- read.csv('OS.csv', header = TRUE)
View(OS)
OS

# Outlier has proportion <.10 of the dataset
# Either combine into "other" (if homogeneous) or delete
# Still wont add to 10% as a group, and could remove important differences in the group e.g "Race"
OS.hi <- subset(OS, Proportion > 0.1) # REMOVE OUTLIERS
# Creating new object, by reaching into OS for anything > 10%
OS.hi # perform when substantial number of outliers for each category

# QUANTITATIVE DATA
# See outliers in boxplots (easiest to work with boxplots)
require("datasets")
?rivers
data(rivers) # Lengths of Major North American Rivers
hist(rivers)
boxplot(rivers, horizontal = TRUE)
boxplot.stats(rivers)
rivers.low <- rivers[rivers < 1210] # REMOVE OUTLIERS
boxplot(rivers.low, horizontal = TRUE) # Has new outliers
# reason; changed total sample size, and also changed the boundries of the middle 50%
boxplot.stats(rivers.low)
rivers.low2 <- rivers[rivers < 1055] # Remove again
boxplot(rivers.low2) # Still one outlier

# Continue if it makes sense to trim outliers off
# make it clear that you are now dealing with a reduced dataset
# NB: When performing analysis, state reason why you selected and removed variables

rm(list = ls())






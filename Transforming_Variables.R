# Ex04_02
# Transforming Variables - When you can't remove variables for outliers

# Load Data
require("datasets")
# The areas in thousands of square miles of the
# Landmasses which exceed 10,000 square miles.
?islands
hist(islands, breaks = 16)
boxplot(islands)

# z-scores
islands.z <- scale(islands) # M = 0, SD = 1
islands.z # Creates a double matrix, not desired result
hist(islands.z, breaks = 16) # Histogram of z-scores
boxplot(islands.z) # Boxplot of z-scores, should be same except numbers since they are in SD
mean(mean(islands.z),2) # Round off to see M = 0
sd(islands.z) # SD = 1
attr(islands.z, "scaled:center") # Show origional mean
attr(islands.z, "scaled:scale") # Showoriginal SD (R maintains the meta data when you standardise it)
islands.z <- as.numeric(islands.z) # Converts from matrix back to numeric
islands.z

# Logarithmic Transformation (When you have a lot of outliers)
islands.ln <- log(islands) # Natural log (base = e)
# islands.log10 <- log10(islands) # Common log (base = 10) written as a power of ten
# islands.log2 <- log2(islands) # Binary log (base = 2) Binary Log
hist(islands.ln)
boxplot(islands.ln)
# NOTE: Add 1 to avoid undefined logs when x = 0
# x.ln <- log(x + 1)

# Squaring
# For negatively skewed variables
# Distribution may need to be recentered so that all values are positive (0 is okay)

# Ranking - maintains the order, but nothing else
islands.rank1 <- rank(islands)
hist(islands.rank1)
boxplot(islands.rank1)
# ties.method = c("average", "first", "random", "max", "min")
islands.rank2 <- rank(islands, ties.method = "random")
hist(islands.rank2)
boxplot(islands.rank2)

# Dichotomizing
# Use wisely and purposefully! (Could exagerate differences between things)
# Split at 1000 (= 1,000,000 square miles)
# ifelse is the conditional element selection
continent <- ifelse(islands> 1000, 1, 0)
continent

rm(list = ls()) # Clean up














# The recommended energy intake for individuals is 7725 Kj. Test whether the daily intake of 11 individuals (5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770) is below the recommended rate.

# Load Data

daily.intake <- c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8230, 8770)

# Exploratory Analysis

qqnorm(daily.intake)
boxplot(daily.intake)

# Single sample t-test

zt.test= t.test(daily.intake, mu = 7725, alternative = "less")
zt.test
# There is evidence to support that data are from a population with a mean less than 7725 Kj (t10=-2.82,p=0.009)

# As with most t procedures we rely on the data being a simple random sample and normally distributed. We will assume the data are a SRS and by inspection of the Q-Q plots it seems reasonable to assume the data are from a population that is normally distributed.




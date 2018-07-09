# Ex 07_03
# Comparing means with the t-test

# Load data
?sleep
sleep[1:5,]
sd <- sleep[,1:2] # Save just the first two variables

# Some quick plots to check data
hist(sd$extra, col = "lightgray")
boxplot(extra ~ group, data = sd) # Check for outliers
# does it lead us to a statistically significant t-test?

# Independent 2-group t-test (with defaults
t.test(extra ~ group, data = sd)

# t.test with options
t.test(extra ~ group,
       data = sd,
       alternative = "less", # One-tailed test
       conf.level = 0.80) # 80% CI (vs. 95%)
# Haven't changed the data, just the standards for the analysis

# Create two groups of random data in separate variables
# Good because actual difference is known
x <- rnorm(30, mean = 20, sd = 5)
y <- rnorm(30, mean = 22, sd = 5)
t.test(x,y)

# Lets you look at to categorical variables on a single quantitative outcome

# Clean Up
rm(list = ls())

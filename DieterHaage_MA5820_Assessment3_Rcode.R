# >>>>>>>>>>>>>>>> Question 1 <<<<<<<<<

# A) 

# Use the function pnorm() 
probA <- pnorm(4500,mean = 4800, sd= 400) # (Quantile, Mean of Distribution, Standard Deviavtion of Normal Distribution)

print(paste("There is a", probA, "probability  that a single randomly-chosen TV will last less than 4,500 hours"))

# B) 

# Use the function dbinom() for binomial distribution
proB <- dbinom(1,16,probA) 

print(paste("There is a", proB,"probability that 1/16 TV's is less than 4,500 hours"))

# C) .....

# >>>>>>>>>>>>>>>> Question 2<<<<<<<<<<<

# 1) Enter data into R
beta <- read.csv('beta.csv', header = T)
View(beta)
str(beta)

# 2) Exploratory Analysis

# Summary
summary(beta$dif)

# qqplot
qqnorm(beta$dif)

# boxplot
boxplot(beta$dif)

# Remove Outlier if over benchmark

# Create Benchmarck
bench <- 23.30 + 1.5*IQR(beta$dif)

# Identify the outlier
Difference <- beta$dif
Difference[Difference>bench]

# Subset data to exclude outlier
NewBeta <- Difference[Difference<bench]

# Check new boxplot
boxplot(NewBeta)

# 3) Significance Test
# One Sample t-test

zt.test=t.test(NewBeta, mu=0, alternative = "greater")
zt.test

# 4) Assumptions:

# The data being a simple random sample and normally distributed. The SRS is normally distributed

# The p-value is below the significance level of 0.05, therefore we reject the Null.

# Have subjects perform the same exercise, and block with age and gender.

#>>>>>>>>>>>>>>> Question 3 <<<<<<<<<<<<<<<

# 1) Load Data

data(PlantGrowth)
PlantGrowth

# 2) Exploratory Analysis

boxplot(PlantGrowth$weight)

# Subset Data
Control <- subset(PlantGrowth, group == "ctrl")
Treat2 <- subset(PlantGrowth, group == "trt2")

# Define Graphical Parameters
par(mfrow=c(1,2))
qqnorm(Control$weight) # Check if Normal
qqnorm(Treat2$weight)

# Data appears to be approximately normal from boxplot
boxplot(Control$weight,Treat2$weight)

# Visually we can see that the weights are lower for the Control compared to the Treatment 2.

# From the boxplot, we can see that there are no extreme outliers, Therefore we do not remove any points from the data set.

xbar <- mean(Control$weight)
ybar <- mean(Treat2$weight)
sx <- sd(Control$weight)
sy <- sd(Treat2$weight)
nx <- nrow(Control)
ny <- nrow(Treat2)

spsqr <- ((nx - 1)*sx^2 + (ny - 1)*sy^2) / (nx + ny - 2)

# Standard Error
std.err <- sqrt(spsqr*(1/nx + 1/ny)) 

# t statistic
tstatistic <- (xbar - ybar) / std.err           

# Degrees of Freedom
degrees.freedom <- nx + ny -2                

print(paste("The t-statistic is",signif(tstatistic,4)))

print(paste("There are",degrees.freedom,"degrees of freedom."))

# Deteremine the observed significance level (p-value)

alpha <- 0.05
tstar <- qt(1-alpha, df=degrees.freedom)
print(paste("tstar is", signif(tstar,4)))

t.test(Control$weight,Treat2$weight, alternative = "two.sided",var.equal = FALSE)


# This p-value is smaller than the significance level of 0.05 and therefore we reject the null hypothesis

# 4) Assumptions:
# The two populations are normally distrubuted
# Two populations have the same variance
# Two samples are independent of each other
# Each sample is obtained using independent random sampling from its corresponding population


rm(list = ls()) # Cleaning Up
 



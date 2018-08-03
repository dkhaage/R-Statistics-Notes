# T-test Practice

# Variables:	Male life expectancy
# Task:	According to the OECD annual report in 2014, the life expectancy of OECD countries was 77.86 for males. A simple random sample of 10 non-OECD countries is given in the file Life_exp_non_OECD_subset.csv which has been taken from the World Health Organisation. Use this dataset to test if the population mean life expectancy of males from non-OECD countries is different to 77.86 years. Interpret your findings.

#1 Load the data 
lifeexp <- read.csv('Life_exp_non_OECD_subset.csv', header = T)
View(lifeexp)
str(lifeexp)

#2 Exploratory Analysis
qqnorm(lifeexp$Male) # The data appears to be approximately normal, given the small sample size.

#3 Remove outliers if appropriate
boxplot(lifeexp$Male) # From the boxplot, we see that there are no extreme outliers. Hence we remove no points from our dataset.

#4 State null and alternative hypothesis

# The null hypothesis (H0) is the mean life expectancy of males from non-OECD countries, and is equal to 77.86 years.

# The alternative hypothesis (HA) is that there is a difference. There is no particular focus on whether this difference in life expectancy is larger or smaller.

# This creates a two-tailed hypothesis which we write down as:

# H0:??=77.86 yearsHA:?????77.86 years

#5 State the significance level

# This is the probability of committing a type I error. We use the common significance level of 5% here. Therefore 
# ??=0.05

#6 Choose the statistical test and check the assumptions

# We choose a one-sample t-test here.
# This test assumes:
#   
# The data are a simple random sample. We were told the countries were selected at random so this is satisfied.
# Observations comes from a population that is normally distributed. The Q-Q plot of the sample data, shown above, indicates that this is a reasonable assumption.

#7 Calculate the test statistic and determine if it is extreme

# t-statistic?

xbar <- mean(lifeexp$Male)
s <- sd(lifeexp$Male)
n<- nrow(lifeexp)
mu0 <- 77.86

tstatistic <- (xbar - mu0)/(s/sqrt(n))

print(paste("The t-statistic is", signif(tstatistic,4)))


# We now have two options to determine if this t-statistic is extreme:
#   
#  A Determine the rejection region. This places emphasis on determining a rejection region of unusual t-values, under the assumption that the null hypothesis is true. The null hypothesis is rejected if the test statistic falls into the rejection region.
#  B Determine the p-value. This approach computes the probability of obtaining a test statistic as extreme or more extreme than that observed, under the assumption that the null hypothesis is true. The null hypothesis is rejected if the p-value is small, meaning less than our significance level.
# In the real world, it is more common to follow option B and quote a p-value. However, in understanding the t-test itself, it is useful here to follow option A and calculate a rejection region.

# (Option A) Determine the rejection region
# The significance level allows us to determine the range of t-statistics which should be rejected. The t-distribution is symmetric and the t-values which place 5% of the probability (the significance level) into the tails of the distribution are found by:

degrees.freedom <- n-1
alpha = 0.05
tstar <- qt(1-alpha/2, df = degrees.freedom)
print(paste("tstar is", signif(tstar,4)))

# That is, we look for the 97.5% quartile. This places 2.5% of the probability at greater than t>t*. Because the distribution is symmetric, this also places 2.5% of the probability at less than t<-t*. On the t-distribution, we can see this visually:
#   
#   
#   The 2.5% probability above t>t^* and the 2.5% probabilty below t<-t* makes a total of 5% probability which is the significance level.
# 
# The range of t-values for which we reject the null hypothesis is t>t* or t<-t*. That is t>2.262 or t<-2.262.
# 
# The t-statistic that we calculated was -6.451. This lies in the rejection region, so we reject the null hypothesis!

# (Option B) Determine the observed significance level (p-value)
# Instead of focusing on what values of the test statistic lead to the rejection of the null hypothesis we now compute the probability of obtaining a test statistic at least as extreme as the test statistic computed from the sample data. Keeping in mind that we are considering a two-tailed test we ask,: 'How probable is it to obtain a t-value greater than or equal to 6.451, or less than or equal to -6.451, under the assumption that the null hypothesis is true?' Visually this probability is represented by the area under the curve and beyond the dotted lines in opposite directions.

# We begin to see the fine detail that there is a small amount of probability in these tails. We can calculate the exact probability in these tails by using the distribution functions in R:

lower.tail <- pt(tstatistic, df=degrees.freedom)
both.tails <- 2*lower.tail

print(paste("p-value of sample mean:", signif(both.tails,4)))

# This p-value is obviously much smaller than the significance level of 0.05 and so we reject the null hypothesis. Furthermore, this p-value allows us to see that we would also have rejected the null hypothesis, even if the significance level was 0.0005 (0.05%).

# Since the calculated test statistic of t=-6.451 falls into the rejection region or, equivalently, the p-value 
# p=1.18×10???4
# is smaller than the significance level of 0.05, we reject the null hypothesis. This means that we believe there is sufficient evidence to conclude that male life expectancy in non-OECD countries is different to that of OECD countries.
# 
# Formally this might be written in a report as:
#   
#   There was sufficient evidence to conclude that male life expectancy in non-OECD countries is different to that of OECD countries 
# (t9=???6.451,p=1.18×10???4)

# Using the t.test function in R
# In R, this process is greatly simplified using t.test:

t.test(lifeexp$Male, conf.level = 0.95, mu=77.86)

# Note that this function, by default, performs a two-tailed test. This is what we desired in this exercise. If we wanted to test against the alternative hypothesis that the non-OECD countries have a lower life expectancy only, we would write:

t.test(lifeexp$Male, conf.level = 0.95, mu=77.86, alternative = "less")






















# Two Independent Samples t-test

install.packages("MASS")
data("cabbages")

# Is vitamin C in C52 cultivar greater than C39?

# We first separate the data into the groups of C39 and C52

C39 <- subset(cabbages, Cult == "c39")
C52 <- subset(cabbages, Cult == "c52")

par(mfrow=c(1,2))
qqnorm(C39$VitC)
qqnorm(C52$VitC)

# The data appears to be approximately normal

labels <- rep(c("C39","C52"), each=nrow(C39))
stack <- c(C39$VitC, C52$VitC)
boxplot(stack ~ labels)

# Visually, we can see that the Vitamin C levels tend to be less in the C39 cultivar compared to the C52 cultivar

# From the boxplot, we see that there are no extreme outliers. Hence we remove no points from our dataset

# The null hypothesis is that there is no difference in the vitamin C levels between the two cultivars. That is, the mean of the vitamin C level is the same for both cultivars.

# The alternative hypothesis is that the mean vitamin C level is higher in the C52 cultivar compared to the C39 cultivar.

# This creates a one-tailed hypothesis which we write down as:

# H0:??C39=??C52
# HA:??C52>??C39

# The significance level: This is the probability of committing a type I error. We use the common significance level of 5% here. Therefore ??=0.05

# Choose Statistical Test: We choose a two-sample independent t-test here.

# The two-sample t-test assumes:

# 1.The data are a simple random sample. We assume that the cabbages grown are a representitive sample of the entire population of cabbages of the same cultivar type.

# 2.Observations come from a population that is normally distributed. The Q-Q plot of the sample data, shown above, indicates that this is a reasonable assumption.

# Calculate the test statistic and determine if its extreme

# The estimate used for the standard error of the difference in means depends on whether we can assume the variance of the two populations are equal. We find that the variances of the samples are:

sd(C39$VitC)
sd(C52$VitC)

# These are reasonably close to allow us to assume equal variances in the calculation of the standard error. 

# We calculate this in R. Note we choose the x variable to be the C52 cultivar and the y variable to be the C39 cultivar. Hence, an increase in the vitamin C would correnspond to Ux being larger tha Uy and hence a positive t-statistic.

xbar <- mean(C52$VitC)
ybar <- mean(C39$VitC)
sx <- sd(C52$VitC)
sy <- sd(C39$VitC)
nx <- nrow(C52)
ny <- nrow(C39)

spsqr <- ((nx - 1)*sx^2 + (ny-1)*sy^2) / (nx + ny - 2)

std.err <- sqrt(spsqr * (1/nx + 1/ny))

tstatistic <- (xbar - ybar) / std.err

degrees.freedom <- nx + ny - 2

print(paste("The t-statistic is", signif(tstatistic, 4)))

print(paste("There are", degrees.freedom,"degrees of freedom"))

# (OPTION A) Determine the rejection region

# The significance level determines the range of the t-statistics which should be rejected. The region which contains 5% of the distribution in the upper tail, that is t>t*, is found by

alpha = 0.05
tstar <- qt(1-alpha, df=degrees.freedom)

print(paste("tstar is", signif(tstar,4)))

# The t-statistic that we calculated was 6.391. This lies in the rejection region, so we reject the null hypothesis!

# (OPTION B) Determine the observed significance level (p-value)

# We calculate the probability of events as, or more, extreme than the observations:

upper.tail <- pt(tstatistic, df=degrees.freedom, lower.tail = F)

print(paste("p-value of sample mean:", signif(upper.tail,4)))

# There was sufficient evidence to conclude that the C52 cultivar has more vitamin C than the C39 cultivar 
# (t58=6.391,p=1.533×10???8)

t.test(C52$VitC, C39$VitC, conf.level = 0.95, var.equal = T, alternative = "greater")







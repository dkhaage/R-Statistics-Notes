# Practice: Confidence interval for the population mean

# Has the composition of the Earth's atmosphere changed over time? During the Cretaceous era some 90 million years ago, the amount of Nitrogen (%) trapped in samples of tree resin was recorded as 63.4, 65.0, 64.4,63.3, 54.8, 64.5, 60.8, 49.1, 51.0.

# Today, the atmosphere has around 78% Nitrogen.

# STEPS
# Enter the data into R
# Perform some exploratory data analysis procedures
# Compute a 95% confidence interval for the population mean nitrogen content of ancient air.
# How does this compare with the compare the composition of Nitrogen in today's atmosphere?
# State any assumptions needed to support the procedure's validity and where possible comment on the adequacy of these assumptions.

# 1

N <- c(63.4, 65.0, 64.4,63.3, 54.8, 64.5, 60.8, 49.1, 51.0)

# 2
qqnorm(N)
hist(N)
boxplot(N, horizontal = T)

# 3

zt.test = t.test(N, conf.level = 0.95)
zt.test

print(paste("The confidence interval is", signif(zt.test$conf.int[1],4),"< N (%) <", signif(zt.test$conf.int[2],4)))

# If the confidence interval is valid, then we would conclude Nitrogen levels are much higher in today's atmosphere.

# As with most t procedures we rely on the data being a simple random sample and normally distributed. Without actually knowing how the scientists obtained these samples, it is difficult for a data scientist to comment on if the data are an SRS or not. Further, we can not even be sure how much gas has diffused through the molecules overtime, so the samples could actually be an underestimate of what was real at the time. Moreover, can we actually assume that these bubbles of air trapped in the tree resin are actually representative of the earth's atmosphere at the time there were trapped?

# Clearly the data are not normally distributed. T procedures will generally be robust against normality if the data are symmetrically distributed. Unfortunately, our data are negatively skewed, so this casts some doubt over the validity of the confidence interval.
# 
# Often, as a data scientist you will be asked to analyse data that is given to you. It is important that you be aware of the assumptions that underpin the methods you implement, and cast shadow over concerns you may have.
# 
# For the interested student, R has a function called boot.ci() that will produce a different type of confidence interval. This procedure has fewer assumptions about the distribution of the data.

# Parametric test - two independant 

# Smoking during pregnancy can be harmful. Test if babies from smoking mothers weigh less than babies from non-smoking mothers. That is, test the following.

# H0:??Smoker=??nonsmoker
# HA:??Smoker<??nonsmoker

dat <- read.csv('birthwt_sub.csv', header = T)

# Exploratory

par(mfrow=c(2,2))
smoker <- dat[dat$smoke==1,]
qqnorm(smoker$bwt, main = "Baby weight of non-smokers")
nonsmoker<- dat[dat$smoke==0,]
qqnorm(nonsmoker$bwt, main = "Baby weight of non-smokers")
boxplot(dat$bwt~dat$smoke)

zt.test=t.test(smoker$bwt, nonsmoker$bwt, conf.level = 0.95, var.equal = T, alternative = "less")
zt.test

# There was ufficient evidence to conclude that babies whose mothers smoked during pregnancy have a lower birth weight than babies born from mothers that did not smoke during pregnancy (t286= -2.653, p=0.004333)


# The data are simple random sample. We will assume this to be the case.

# Samples are from a population with a normal distribution or the sample size of each group is greater than 30 (central limit theorom). We can check this assumption with Q-Q plots. Based on the figures showing above, we can assume the data are from populations with a normal distribution.
# ANOVA Tests

# Variables:	Insecticide effectiveness, brand of insect spray
# Task:	Insects can destroy agricultural crops. In this exercise, we use some data from the base R datasets on the effectiveness of insect sprays. The dataset contains tests of 6 different brands of insect spray and associated measures of insect counts. Test if there appears to be a difference in the mean insect count among the six brands of insect spray. If a significant difference is determined, perform a post-hoc procedure to test which pair of insect sprays differ.

#1 Load Data

data("InsectSprays")
View(InsectSprays)
str(InsectSprays)

# Exploratory Analysis
old.par = par(mar = c(0,0,0,0))

par(mfrow=c(2,3))

InsectSprays$sqrtcount <- sqrt(InsectSprays$count)
par(mfrow=c(2,3))
for (label in c("A","B","C","D","E","F")) {
  temp <- InsectSprays$sqrtcount[InsectSprays$spray == label]
  temp <- sqrt(temp)
  qqnorm(temp, main=label)
  qqline(temp)
}

par(mfrow=c(1,1))

# The data closely follow normal distributions

boxplot(count~spray, data=InsectSprays)

# Insect sprays A, B and F seem to be less effective than sprays C, D and E.

# Insect sprays A, B and F are also much more variable than sprays C, D and E. This could be problematic for the ANOVA procedure. We therefore propose a squareroot transformation to determine if this creates groups that have similar variability and still maintain the assumption of normality.

# The squareroot transformation has helped to create groups of similar spread, however, there is an outlier that should be removed from this set. This is case 39. We therefore continue to use the squareroot transformed data throughout this analysis without the 39th observation.

InsectSprays=InsectSprays[-39,]
boxplot(sqrtcount~spray, data=InsectSprays)

#3 State the null and alternative hypothesis
# The null hypothesis is that there is no mean difference in squareroot transformed insect counts between the different insect sprays on squareroot transformed.
# 
# The alternative hypothesis is that there is a difference in the means of the squareroot transformed insect counts.
# 
# This creates a hypothesis, which we write down as:
  
  # H0:??A=??B=??C=??D=??E=??FHA:??i?????j for at least one pair of insect sprays, i and j

# Step 4: State Significance level
# This is the probability of committing a type I error. We use the common significance level of 5% here. Therefore ??=0.05.

# STEP5: Choose statistical test and check assumptions

# As we compare multiple groups of data and we wish to identify a difference in their means, we use the ANOVA test.
# 
# This test assumes:
#   
#   Each group of data are a simple random sample from its population. We have been told that the dataset we were provided with is a simple random sample.
# Each group of data are normally distributed. Inspection of the Q-Q plots indicates this is a reasonable assumption. Keep in mind that no dataset will ever be perfectly normally distributed and fortunately the ANOVA is fairly robust against violations of normality when there are no outliers (Basic Practice of Statistics, Third Edition, David S Moore, page 612).
# All populations have the same standard deviation. From the boxplots we see that the spread is fairly similar among most of the treatments. Again, we note that the ANOVA procedure is not very sensitive to violations of this assumption, especially when the sample sizes of the treatment groups are similar (Basic Practice of Statistics, Third Edition, David S Moore, page 612).

#6 Calculate the test statistic and determine if it is extreme

# We calculate this in R. Note that the approach below could be made more efficient using table functions or a for loop, however we present it this way for clarity.

totmean = mean(InsectSprays$sqrtcount)
countA = InsectSprays$sqrtcount[InsectSprays$spray == "A"]
countB = InsectSprays$sqrtcount[InsectSprays$spray == "B"]
countC = InsectSprays$sqrtcount[InsectSprays$spray == "C"]
countD = InsectSprays$sqrtcount[InsectSprays$spray == "D"]
countE = InsectSprays$sqrtcount[InsectSprays$spray == "E"]
countF = InsectSprays$sqrtcount[InsectSprays$spray == "F"]
meanA = mean(countA)
meanB = mean(countB)
meanC = mean(countC)
meanD = mean(countD)
meanE = mean(countE)
meanF = mean(countF)
nA = length(countA)
nB = length(countB)
nC = length(countC)
nD = length(countD)
nE = length(countE)
nF = length(countF)

SSG = nA*(meanA - totmean)^2 + nB*(meanB - totmean)^2 + nC*(meanC - totmean)^2 + nD*(meanD - totmean)^2 + nE*(meanE - totmean)^2 + nF*(meanF - totmean)^2

SSE = sum((countA - meanA)^2) + sum((countB - meanB)^2) + sum((countC - meanC)^2) + sum((countD - meanD)^2) + sum((countE - meanE)^2) + sum((countF - meanF)^2)

k = 6
n = nrow(InsectSprays)
dfreedom.group = k - 1
dfreedom.tot = n - k

ANOVA.Fstatistic = (SSG / dfreedom.group) / (SSE / dfreedom.tot)

print(paste("The ANOVA F-statistic is",signif(ANOVA.Fstatistic,4)))

print(paste("with",dfreedom.group,"and",dfreedom.tot,"degrees of freedom."))

# Option A Determine the rejection region

# The significance level determines the range of ANOVA F-statistics which should be rejected. We are only concerned about the tail for large F-statistics. The region which contains 5% of the distribution in the upper tail, that is F>F*, is found by

alpha = 0.05
fstar <- qf(1 - alpha, df1=dfreedom.group, df2=dfreedom.tot)

print(paste("fstar is",signif(fstar,4)))

# The F-statistic that we calculated was 48.24. This lies in the rejection region, so we reject the null hypothesis!

# Option B Determine the observed significance level (p-value)

upper.tail <- pf(ANOVA.Fstatistic, df1=dfreedom.group, df2=dfreedom.tot, lower.tail=F)
print(paste("p-value of F-statistic:", signif(upper.tail,4)))

# This p-value is smaller than the significance level of 0.05 and so we reject the null hypothesis. As the p-value is very close to zero, it gives us good confidence that we should reject the null hypothesis.

# Step 7: Interpret your findings

# There was sufficient evidence to conclude that at least two of the insecticide sprays have a different effectiveness 
# (F5,65=48.24,p=1.393×10???20)

# Using the oneway.test function
oneway.test(sqrtcount ~ spray, data=InsectSprays, var.equal=T)
# One-way analysis of means
# We read off the p-value here, which tells us that we should reject the null hypothesis.

# Using the 'aov' function

aov.obj <- aov(sqrtcount ~ spray, data=InsectSprays)
aov.obj

aov(formula = sqrtcount ~ spray, data = InsectSprays)

# We then obtain the summary:

summary(aov.obj)
# As the p-value is small, we reject the null hypothesis.


# Post-Hoc Test

# Since the ANOVA test found evidence to support a difference in means, we need to do a post-hoc procedure to determine which means differ. We use the pairwise t-test with a Bonferroni correction.

tapply(InsectSprays$sqrtcount, InsectSprays$spray,mean)


pairwise.t.test(InsectSprays$sqrtcount, InsectSprays$spray, p.adjust.method = "bonferroni")

# From the sample means, inspection of the boxplots and p-values of each pair-wise comparison, the results show that sprays A, B and F perform similarly, and D and E perform similarly, and C and E perform similarly. There is evidence to support a difference in means for all remaining combinations.



























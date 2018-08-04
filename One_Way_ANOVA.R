# One Way Anova

# In this exercise, we are investigating if male youth alcohol consumption differs between the three regions: Africa, the Americas and Europe. We have been provided with a dataset from the World Health Organisation, which we will assume is a simple random sample of countries from these three different regions. Each observation represents the per capita amount of pure alcohol consumed in the year in litres for young males. Perform a one-way ANOVA to test:
  # H0:??Africa=??Americas=??EuropeHA:??i?????j for at least one pair of regions, i and j

# Load Data
z <- read.csv("Young_ac_male_region.csv")
View(z)
str(z)

# Exploratory Analysis

# Produce Q-Q plots and boxplots. Note Q-Q plots and boxplots need to be done separately for each region.

par(mfrow=c(2,3))
for(label in c("Africa","Americas","Europe")) {
  temp <- z$Level[z$region == label]
  qqnorm(temp, main=label)
}

par(mfrow=c(1,1))

boxplot(z$Level~z$region)

# Perform One Way ANOVA

zout=oneway.test(Level~region, data = z, var.equal = T)
zout

# There is evidence to support the claim that the three population means are not the same and that there is a regional effect on alcohol consumption by young males.

# (F2,12=7.505116, p=0.00769)


# Post-Hoc Test

# Since the ANOVA test found evidence to support a difference in means, we need to do a post-hoc procedure to determine which means differ. We use the pairwise t-test with a Bonferroni correction.

tapply(z$Level, z$region,mean)

pairwise.t.test(z$Level, z$region, p.adjust.method = "bonferroni")

# From the sample means, inspection of the boxplots and p-values of each pair-wise comparison, we see that male youth alcohol consumption is higher for countries from Europe and that the difference in alcohol consumption is signficantly different between Europe and Africa.

# As we compare multiple groups of data and we wish to identify a difference in their means, we use the ANOVA test.

# This test assumes:
  
  # Each group of data are a simple random sample from its population. We assume this to be the case.
# Each group of data are normally distributed. Inspection of the Q-Q plots indicates this is a reasonable assumption. Keep in mind that no dataset will ever be perfectly normally distributed and fortunately the ANOVA is fairly robust against violations of normality when there are no outliers (Basic Practice of Statistics, Third Edition, David S Moore, page 612). The boxplot for alcohol consumption for Europe does exhibit a very high point outlier which we consider not to be extreme. If you are concerned about the impact of this point, you could rerun the analysis with this point excluded.
# All populations have the same standard deviation. From the boxplots we see that the spread is fairly similar among most of the treatments. Again, we note that the ANOVA procedure is not very sensitive to violations of this assumption, especially when the sample size of the treatment groups are similar (Basic Practice of Statistics, Third Edition, David S Moore, page 612).



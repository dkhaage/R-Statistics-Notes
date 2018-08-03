# TWO-SAMPLE TESTS OF CENTER

# t.test(x, y, alternative="two.sided",var.equal=FALSE)

m300 <- c(284, 279, 289, 292, 287, 295, 285,279,306,298)

m600 <- c(298, 307, 297, 279, 291, 335, 299, 300, 306, 291)

# Check to see wether the assumption of a common variance and normality seems appropriate by looking at two density plots
plot(density(m300))
lines(density(m600))

# density estimates indicate normally distributed populations with similar spreads. As such the t-test looks appropriate.

t.test(m300,m600, var.equal = TRUE)

# p-value is 0.05696 for the two-sided test. Suggests a difference in the mean values, but it is not statistically significant at the 0.05 significance level. A look at the reported confidence interval for the difference of the means shows a wide range of possible value for Ux-Uy. We conclude that this data is consistent with the assumption of no mean difference. How would this have been different if we did not assume equal variance?

t.test(m300, m600)

# The same observed value of the test statistic (marked t) is found as in the equal-variance case, as (9.5) and (9.6) yield identical standard errors when the two sample sizes are the same. We get a larger p-value, though, as the degrees of freedom differ. The t.test function has no assumption of equal variance as the default. Though making this assumption can produce smaller p-value, it should only be done if applicable and before considering the data.




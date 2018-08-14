# The objective of this exercise is to reinforce the importance of checking the assumptions of the linear model, especially the assumptions pertaining to residuals. Checking the behavior of the residuals can inform the data scientist on ways to improve the model

# The process
# Perform a linear regression on the data, using the mantel length as the response variable and weight as the independent variable. (Hint: you should take advantage of lm() and other "shortcut" functions in R).
# How appropriate is the fitted model for describing mantel length from weight? How did you reach your conclusion? (Hint: you should find that the model is not suitable).
# Take the squareroot of weight. Investigate the appropriateness of the fitted model using the mantel length as the response and the squarerooted weight as the independendent variable.


# 1) Load Data

squid <- read.csv('squid.csv', header = T)
View(squid)
str(squid)
# Looking closely at the data we see there is one NA which we remove:
squid <- squid[complete.cases(squid),]

# 2) Exploratory Analysis

plot(squid$weight, squid$mantel.length, xlab = "Weight (Kg)", ylab = "Mantel Length (cm)")

par(mfrow=c(1,2))
boxplot(squid$weight, ylab="Weight (kg)")
boxplot(squid$mantel.length, ylab="Mantel length (cm)")

# 3) Remove outliers
# There are no severe outliers to remove

# 4) Estimate the Parameters
# We use lm() to find the linear regression and output all the relevant information using summary():

zmodel <- lm(mantel.length ~ weight, data=squid)
summary(zmodel)

# From looking at the summary alone, it would appear that the regression indicates the linear model has fit the data rather well:

# The R2 value is reasonably large (0.8826)

# The population slope is significantly different to zero 

# (t148=33.36,p<2×10???16)

# The population R2 is significantly different to zero 

# (F1,148=1113,p<2×10???16)

# The five-number summary of the residuals indicate they are roughly symmetrically spread about zero.

# 5) Compute the fitted values of the linear model

mantel.fitted <- fitted(zmodel)

plot(mantel.fitted, squid$mantel.length, xlab = "Fitted mantel length (cm)", ylab = "Actual mantel length (cm)")
abline(0,1, lty=2)

# This scatterplot shows that there is some discrepancy between the fitted values of the model and the actual data values.

# 6) Compute the residuals of a linear model

mantel.resid <- resid(zmodel)

# 7) Comment on the validity of the assumptions of a linear model

# In order to satisfy the assumptions of the linear model, the residuals should:

# be approximately normally distributed.
# be approximately independent.
# have constant variance.
# There is a clear violation of the constant variance assumption (see below)

# Normality of the residuals

# A Q-Q plot allows us to visually inspect the normality of the residuals:

qqnorm(mantel.resid)
qqline(mantel.resid)

# The Q-Q plot shows that the residuals are somewhat normally distributed.

plot(mantel.resid, type = "b", ylab = "Residuals")
abline(h=0, lty=2, col = "grey")

# There appears to be little pattern in the sequence of residuals. We also perform a Durbin Watson test to quantify the "serial correlation" of pairs of points. Note: the dwtest() function is available from the lmtest library, for more details type help(dwtest) after you have loaded the library.:

install.packages('lmtest')
library(lmtest)
dwtest(zmodel)

# The Durbin-Watson test statistic is 1.7. If there is no first order autocorrelation, then the Durbin-Watson test statistic can lie between 1.5 and 2.5.

# Constant variance of the residuals

mantel.resid <- resid(zmodel)

plot(mantel.fitted, mantel.resid, xlab = "Fitted mantel length (cm)", ylab = "Residual")
abline(h=0, lty=2)

# It is clear that the assumption of constant variance has been violated. That is, for small and large fitted lengths the residuals are mostly negative but for intermediate weights the residuals are mostly positive.

# 8) Transforming the Data - square root

# The assumption of constant variance of the residuals was not valid in the raw data, so we consider a transformation to improve the linear regression. From the curve of the raw data, it is obvious that as the weight increases, so does the mantel length. However, mantel length increases more slowly for larger weights. This might lead us to believe the data has the form:
  
#   mantel=??+??weight?????????????????????+??i

plot(sqrt(squid$weight), squid$mantel.length, xlab="sqrt(weight)", ylab="Mantel length (cm)")
# This looks much better than the raw data. We will now perform the linear regression using this assumed relationship between mantel length and weight.

# 9) Regression on transformed data

zmodel2 <- lm(mantel.length ~ sqrt(weight), data=squid)

summary(zmodel2)

# We can note a few things:
  
# The p-value has remained small for the tests for the population slope and R2 to be different from zero 

# (t148=42.11,p<2×10???16andF1,148=1773,p<2×10???16)

# The R2 value has increased from 0.8826 with the raw data to 0.923 using the transformed predictor variable.

# We also check that the residuals are behaving as assumed in the linear model:

mantel.resid2 <- resid(zmodel2)
mantel.fitted2 <- fitted(zmodel2)

plot(mantel.fitted2, mantel.resid2, xlab="Fitted mantel length (cm)", ylab="Residual")
abline(h=0, lty=2)

qqnorm(mantel.resid2)
qqline(mantel.resid2)

plot(mantel.resid2, type="b", ylab="Residual")
abline(h=0, lty=2, col="grey")

dwtest(zmodel2)

The scatterplot shows that there is no obvious violation in the assumption of constant variance. This is great as it was the problem in the regression of the original data. The Q-Q plot shows that the residuals are approximately normally distributed.

# The scatterplot of the residuals in sequence and the Durbin-Watson test statistic of are more concerning. The p-value (p=0.0005606) of the Durbin-Watson test-statistic (DW=1.4767) indicates that there is some association among the residuals which could be problematic. To rectify this problem, try experimenting with other transformations including log transformations. Also experiment with transforming the response. (Hint: taking the square root of both mantel length and weight improves the outcome of the Durbin-Watson Test.

























































# Regression Analysis

# 1) Load Data
lifeexp <- read.csv("lifeexp.csv")
View(lifeexp)
str(lifeexp)

all(complete.cases(lifeexp)) #  Check for missing data

all(lifeexp$lifeexp.male>0) #  Make sure data is positive
all(lifeexp$lifeexp.female>0)



# 2) Exploratory Analysis

boxplot(lifeexp[,-1], names = c("female","male"), ylab="Life expectancy (years)")#  Boxplots

plot(lifeexp$lifeexp.male, lifeexp$lifeexp.female, xlab="Male life expectancy (years)", ylab="Female life expectancy (years)")

# 3) Remove appropriate outliers
# No visual evidence of outliers

# 4) Estimate Parameters

x <- lifeexp$lifeexp.male
y <- lifeexp$lifeexp.female

xbar <- mean(x)#  Alternatively, xbar <- sum(x)/length(x)
ybar <- mean(y)

numerator <- sum((x-xbar)*(y-ybar))
denominator <- sum((x-xbar)^2)

betahat <- numerator/denominator

alphahat <- ybar-(betahat*xbar)

print(paste("Alphahat =", signif(alphahat,4), ", Betahat = ", signif(betahat, 4)))

# Estimate of Standard Error

yhat <- alphahat + betahat * x # predicted/fitted values of y.

betahat.err <- sqrt(1/(length(x)-2) * sum((y-yhat)^2) / sum((x-xbar)^2))

print(paste("standard error of betahat = ", signif(betahat.err,4)))

# Hence slope has value od betahat = 1.12 with SE = 0.03

# Using inbuilt statistical functions
# Finding regression coefficients

zmodel <- lm(lifeexp.female ~ lifeexp$lifeexp.male, data = lifeexp)

summary(zmodel)

# Call:
lm(formula = lifeexp.female ~ lifeexp.male, data = lifeexp)

# 5) Compute fitted values of a linear model

# With the estimators of the slope and intercept, we calculate the predicted values of the model:
female.fitted <- alphahat + betahat * lifeexp$lifeexp.male

# Using linear model created by R, we use the predict() function
female.fitted <- predict(zmodel)

# The predict() function has extra features to calculate intervals which we will take advantage of later. For the moment, we plot the observed values for the response against fitted values:
par(mar=par()$mar + c(0,1,0,0))
plot(female.fitted, lifeexp$lifeexp.female, xlab ="Fitted values of \nfemale life expectancy (years)", ylab="Actual values of\nfemale life expectancy (years)")
abline(0,1, lty=2)

# If the fitted values were identical to the actual values, all the points would fall on the line. This is not quite the case, but there is a remarkable correspondence between the fitted values and the observed values of female life expectancy.

# 6) Compute linear model residuals

# Calculated as the diff between the prediction and observed values:
residuals<- y-yhat

# Using resid() to obtain residuals
residuals<- resid(zmodel)

# 7) Comment on the validity of the assumptions of a linear model

# After forming a linear model there are several aspects we should verify:

# a) Check that the assumptions of the residuals are satisfied.
# b) Check that R^2 to determine if the explanatory power of the model is useful (we do not want to use a model to make predictions if the R2 is too small).
# c) Check that the model passes important significance tests about the population slope and population R^2.

# Assumptions of the residuals:

# A linear model places assumptions on the residulas obtained from the model. In particular, these residuals should:

# * be approximately normally distributed;
# * have constant variance;
# * be approximately independent.

# We test the normal distribution of the residuals:

qqnorm(residuals)
qqline(residuals)

# The Q-Q plot shows the residuals are approximately normal.

# To test for constant variance we create a scatterplot of the residuals against the fitted values. Ideally you should not see a pattern and the points should be randomly scattered around the horizontal axis.

plot(female.fitted, residuals, xlab = "Fitted female life expectancy (years)", ylab = "Residual(years)")
abline(h=0, lty=2)

# The scatterplot shows that there is no discernible pattern to the residuals and that it is therefore reasonable to assume the residuals meet the assumption of constant variance.

# Finally, we check the independence of the residuals by plotting them in the sequence in which they appeared in the data. We do not want this plot to show any trending or cyclic features.
plot(residuals, type= 'b', ylab = "Residual")
abline(h=0, lty=2, col='grey')

# There is no discernable pattern in the residuals which leads us to believe that the assumption of independence for the residuals is vaild

# 8) Compute R-Squared value & test Significance

Rsquared <- 1- sum((y-yhat)^2)/ sum((y-ybar)^2)
print(Rsquared)
# The R^2 value indicates that 98.7% of the variability in the female life expectancy is explained by the linear model. This indicates that the model is potentially a very good fit and could be useful for making predictions about female life expectancy for other countries from the population from whhich our sample was drawn. We must perform some significance tests to confirm if this is the case.

# The R^2 value can be obtained from the summary() function(see earlier output)

# Test significance: We can perform a significance test to determine if the population R^2 is significantly different to zero. The null hypothesis (Ho) is that the population R^2 is equal to zero and the alternative hypothesis (Ha) is that the population R^2 does nott equal zero, that is R^2 is positive. The test statistic follows an F-distribution with p-1 numerator and n-p denominator degrees of freedom:

p <- 2

n <- nrow(lifeexp)
numerator <- sum((yhat-ybar)^2) / (p - 1)
denominator <- sum((y - yhat)^2) / (n - p)
Fval <- numerator / denominator
print(paste("F =", signif(Fval,4)))

pvalue.ftest <- pf(Fval, df1=p-1, df2=n-p, lower.tail=FALSE)
print(paste("pvalue = ", signif(pvalue.ftest,4)))

# The p-value here is very small, giving us the confidence that these data come from a population whose R^2 is different to zero. Equivalently, we can also be confident that these data come from a population where there is a trend between male life expectancy and female life expectancy.

# Using R Functions

# The F-statistic, along with the degrees of freedom and associated p-value can be obtained directly from the summary() function in R(see above)

# Call:
summary(zmodel)
# The last line of the output details the F-statistic

# 9) Test the significance of the slope

# WE should also perform a significance test to determine if there is sufficient evidence to support that these data come from a population with a non-zero slope. We perform a t-test with the Ho that the population slope is zero. The Ha is that the population slope is not flat. 

# This test statistic follows a t-distribution with n-p degrees of freedom.

# We must use R to compute the value of t-statistic and compute the probability of obtaining a t-statistic as extreme or more extrem than that observed. The tdistribution has n-p degrees of freedom:

t <- betahat/betahat.err
print(paste("t = ", signif(t,4)))
pvalue <- 2*pt(abs(t), n-p, lower.tail=F)
print(paste("pvalue = ", signif(pvalue,4)))

# This p-value is identical to the p-value of the F-test above. This will always be identical for a bivariate linear model. For multivariate regression this will differ.

# Using R functions:
# The t-statistic, along with the degrees of freedom and associated p-value can be obtained directly from the summary() function in R(see above)

# 10) Show the line of best fit & confidence and prediction bands for the model

# The confidence and prediction intervals from first principles can be obtained from some complex formulae. Here, we consider the inbuilt functions in R only.

# Using R Functions:

# We can also make use of R's ability to generate prediction values to plot the data with confidence and prediction intervals. Note that, in order to obtain a smooth curve, we must first generate a set of evenly spaced points to use on the x-axis.

xgrid <- seq(40, 80, length.out=101)
xgridframe <- data.frame(lifeexp.male=xgrid)
pc <- predict(zmodel, xgridframe, interval="confidence")
pp <- predict(zmodel, xgridframe, interval="prediction")
fit <- pc[,1]

plot(lifeexp$lifeexp.male, lifeexp$lifeexp.female, xlab="Male life expectancy (years)", ylab="Female life expectancy (years)")
lines(xgrid, fit)
matlines(xgrid, pc[,-1], col=1, lty=2)
matlines(xgrid, pp[,-1], col=1, lty=3)

legend(42,82, c("Line of best fit", "Confidence interval", "Prediction interval"), lty=c(1,2,3))

# The narrow (confidence) bands show the uncertainty about the line of best fit, and the wider (prediction) bands reflect the uncertainty in the prediction of future observations. The tightness of both sets of bands indicate that we can be confident about the linear model and predictions derived from the model.



























































































































































# Bivariate Regression

# Looking at the association between two quantitative variables.

# Load data
?trees
data(trees)
trees[1:5,]

# Quick graphical check on the data
hist(trees$Height)
hist(trees$Girth)
plot(trees$Girth, trees$Height)
abline(lm(trees$Height ~ trees$Girth)) # Height as a function of girth

# Linear regression model
reg1 <- lm(Height ~ Girth, data = trees)#  Create Model for girth to predict height
reg1
summary(reg1)
# Residuals has to do with how far the dots are from the regression line. It is an important indicator of how well the regression line works

# If (Intercept) Pr(>|t|) is small, indicates that the intercept is probably not 0.

# We are usually more interested in the slope. Girth Pr(>|t|). In this case 0.00276. This is smaller than out cutoff of 0.05. This indicates that Girth is a good predictor of Height.

# Multiple R-squared (Has to do with the correlation coefficient). This tells us that the girth of the tree can account for/predict about 27% of the Variance in the variable Height. The overall equation has a p-value of 0.002758, this is the same for Girth Pr(>|t|) because we are doing bivariate regresiion and this would differ if we had multiple variables.

# Confidence intervals for coefficients
confint(reg1)
# Provides lower and upper confidence intervals
# 0 is not included, means there is probably a substantial non-zero association between the two

# Predict values based on regression equation
predict(reg1) # Predicted height based on girth
predict(reg1, interval = "prediction") #  CI for predicted height

# Regression diagnostics
lm.influence(reg1)#  How much each observation impacts the overall equation
influence.measures(reg1)#  Case by case

rm(list = ls())














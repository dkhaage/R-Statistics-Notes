corrdata <- read.csv('corrdata.csv', header = T)
View(corrdata)
str(corrdata)

plot(corrdata$x, corrdata$y, xlab='Predictor', ylab = 'Response')#  Clear outlier in the data

# PEARSON CORRELATION COEFFICIENT

zpearson1 <- cor(corrdata$x, corrdata$y)
#  The outlier is the last data point, that is the 21st row
corrdata2 <- corrdata[-21,]
zpearson2 <- cor(corrdata2$x, corrdata2$y)

print(paste("Pearson coefficient : with outlier = ", signif(zpearson1), " without outlier = ", signif(zpearson2))) # Shows change in value

# SPEARMAN'S CORRELATION COEFFICIENT

# Option A

spearman1 <- cor(corrdata$x, corrdata$y, method="spearman")
spearman2 <- cor(corrdata2$x, corrdata2$y, method = "spearman")

print(paste("Spearman's coefficient: with outlier = ", signif(spearman1,4)," without outlier = ", signif(spearman2, 4))) #  outlier has a smaller effect on Spearmans

# Option B

corrdata$xranked <- rank(corrdata$x)
corrdata$yranked <- rank(corrdata$y)

corrdata2$xranked <- rank(corrdata2$x)
corrdata2$yranked <- rank(corrdata2$y)

head(corrdata)

spearman1 <- cor(corrdata$xranked, corrdata$yranked)

spearman2 <- cor(corrdata2$x, corrdata2$y)

print(paste("Spearman's coefficient: with outlier =  ", signif(spearman1, 4), " without outlier = ", signif(spearman2, 4)))

# KENDALL'S TAU COEFFICIENT

tau <- cor(corrdata$x, corrdata$y, method = "kendall")
tau2 <- cor(corrdata2$x, corrdata2$y, method = "kendall")

print(paste("Kendall's tau coefficient: with outlier = ", signif(tau,4), " without outlier = ", signif(tau2,4)))

# Option B

# We can use boolean logic, the operators & (and), | (or) and ! (not), to calculate the tau coefficient.
# This makes i and j take every pair of indices available.
n <- nrow(corrdata)
i <- rep(1:n,each=n)
j <- rep(1:n,n)

x <- corrdata$x
y <- corrdata$y

# We read this as "(xi > xj AND yi > yj) OR (xi < xj AND yi < yj)"
concordant <- (x[i] > x[j] & y[i] > y[j]) | (x[i] < x[j] & y[i] < y[j])
discordant <- (x[i] < x[j] & y[i] > y[j]) | (x[i] > x[j] & y[i] < y[j])

num.concordant <- sum(concordant)
num.discordant <- sum(discordant)
num.pairs <- n*(n-1)

tau <- (num.concordant - num.discordant) / num.pairs

print(paste("Kendall's tau coefficient: with outlier = ", signif(tau,4)))




















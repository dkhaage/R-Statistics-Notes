bodyWeights= rnorm(n=500, mean=80, sd=10)
bodyWeights= c(bodyWeights, rnorm(n=500, mean =65, sd=10))

gender = rep(c("Male","Female"), each = 500)
gender= factor(gender)

gender1= factor(gender, levels = c("Male","Female"))

plot(bodyWeights ~ gender, col="lightgreen",las=1)
plot(bodyWeights ~ gender1, col="red", las=1)

Year = 2006:2015
Density = c(5,3,7,8,6,9,8,10,14,11)
lm(Density~Year)
plot(Density~Year, type="p", pch=16, col="red", cex=1.5, las=1)
abline(-1807.442, 0.903, lwd=2, lty=2, col="red")
text(x=2008,y=12,
     labels="Density = -1807.442 + 0.903")

fitted = -1807.442 + 0.903*Year
points(fitted~Year, cex=1.5, col="black")

isHigh = Density > fitted
isHigh
which(isHigh)
Year[which(isHigh)]

seedlings = data.frame(Year, Density, fitted, isHigh)

weights = data.frame(gender, bodyWeights)

seedlings[1,1]

seedlings[1:3, c(1,3)]

seedlings[,1]
seedlings[1,]

rm(Year, Density, fitted, isHigh)

plot(seedlings$Density ~ seedlings$Year, pch=16)

plot(seedlings[,2] ~ seedlings[,1],pch=16)

with(seedlings, plot(Density ~ Year, pch=16))

plot(Density~Year, pch=16, data = seedlings)

rm(list =ls())

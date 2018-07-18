
bodyWeights <- rnorm(n=500, mean = 80, sd=10)

vertebrateSpecies <- c(Fish= 3200, Amphibia=7302, Reptiles=10038, Birds=10425, Mammals=5513)

vertebrateSpecies

Year <- 2006:2015
Year

Density <- c(5, 3, 7, 8, 6, 9, 8, 10, 14, 11)

Density2 = c(6, 6, NA, 7, NA, 8, 10, 11, 10, 15)
Density2

vertebrateSpecies/1000

sum(vertebrateSpecies)

percentageSpecies <- round(100* vertebrateSpecies/ sum(vertebrateSpecies),1)
percentageSpecies

sum(percentageSpecies)

pie(vertebrateSpecies)
barplot(percentageSpecies)

barplot(percentageSpecies,
        las=1,
        col="orange",
        ylab= "% of total vertebrate species",
        main="Distribution of species among\n vertebrate groups",
        ylim=c(0,55))

colors()


mean(bodyWeights)
median(bodyWeights)
sd(bodyWeights)
range(bodyWeights)
var(bodyWeights)
length(bodyWeights)
summary(bodyWeights)

boxplot(bodyWeights)
?boxplot

hist(bodyWeights)

hist(bodyWeights,
     las=1,
col="lightblue", 
xlab= "Body weight (kg)", ylab= "Number of individuals",
main= "Distribution of male body weights",
labels=T,
ylim=c(0,120))

box()

mean(Density2)
mean(Density2, na.rm = TRUE)

is.na(Density2)
which(is.na(Density2))
which(!is.na(Density2))

plot(Density~Year, type="b", pch=16,
     col="red", cex=1.5, las=1)
cor(Year, Density)

lm(Density~Year)

plot(Density~Year, type="p", pch=16,
     col="red", cex=1.5, las=1)
abline(-1807.442, 0.903, lwd=2, lty=2, col="red")

text(x=2008, y=12, labels="Density = -1807.442 + 0.903 Year")

summary(Density)
summary(Density2)


na.omit(Density2)
plot(Density~Density2, type= "b",pch=16,col="red", cex=1.5, las=1)

rm(list = ls())

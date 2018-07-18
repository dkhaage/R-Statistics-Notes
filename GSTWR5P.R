OceaniaGDP = read.csv('OceaniaGDP.csv', header = TRUE)
head(OceaniaGDP)

OceaniaGDP <- arrange(OceaniaGDP, per.capita.GDP)

Labels <- as.character(OceaniaGDP$Country)

barplot(OceaniaGDP$per.capita.GDP, horiz=T, names=Labels, las=1)

?par

opar = par() # store default
par(mar=c(5,14,4,2)) # Increase left margin

barplot(OceaniaGDP$per.capita.GDP, horiz=T, names = Labels, las=1, xlim=c(0,50000), col="turquoise", xlab="Per capita GDP, 2014", main= "Per Capita GDP in countries of Oceania")

box()
par(opar)

Town.A = c(2246,1877,482,205)
Town.A = 100*Town.A/sum(Town.A)
Town.B = c(1125,1318,404,130)
Town.B = 100*Town.B/sum(Town.B)
Town.C = c(978,525,215,101)
Town.C = 100*Town.C/sum(Town.C)
VoterIntention = cbind(Town.A, Town.B, Town.C)
rownames(VoterIntention) = c("LNP","Labour","Green","Other")

VoterIntention
barplot(VoterIntention, legend.text=TRUE)

barplot(VoterIntention, legend.text=T, xlim=c(0.2,7.0), las=1, ylab="Percentage of respondents", col =c("blue","red","green","grey"), main= "Voter intenetions in three towns")
abline(h=0)

haemoglobin <- read.csv('haemoglobin.csv',header = T)
haemoglobin

boxplot(Hb~group, data = haemoglobin, las=1)
?boxplot

boxplot(Hb ~ group, data= haemoglobin, las=1, ylab="Haemoglobin concentration (g/dl)", main="Haemoglobin concentrations in four populations", col="orange", border="darkred")

plantGrowthExpt <- read.csv('plantGrowthExpt.csv', header = T)
head(plantGrowthExpt, 4)

boxplot(height.cm~variety*treatment, data=plantGrowthExpt, col=c("gold","lightgreen"), las=1, xlab="Variety and Treatment", ylab="Height (cm)", main="Heights of varieties A & B\n with different hormone levels")

boxplot(height.cm~treatment*variety, data=plantGrowthExpt, col=rep(c("gold","lightgreen"), each=3), las=1, xlab="Variety and Treatment", ylab="Height (cm)", main="Heights of varieties A & B\n with different hormone levels")


trialdata <- rnorm(100)
qqnorm(trialdata, las=1)
qqline(trialdata, col ="red", lwd=2)

CO2Australia <- read.csv('perCapitaCO2.Australia.csv', header = T)

plot(CO2~Year, data=CO2Australia, type="b", lwd=2, las=1, col="darkgreen", cex=1.2, ylab="Per capita CO2 emissions\n 2002 to 2008")

opar = par()
par(mar=c(5,6,4,2))

plot(CO2~Year, data=CO2Australia, type="b", lwd=2, las=1, col="darkgreen", ylab="", main = "Australian per capita CO2 emissions\n 2002 to 2008")
title(ylab = "Per capita CO2 emissions", line=4)
par(opar)

rm(list= ls())




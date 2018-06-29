# Ex05_02
# Analyzing by subgroups
# Using aggregate in order to split up and see results of the groups, 
# or use cbind to get multiple variables at once


# Load data
?iris
data(iris)
iris
mean(iris$Petal.Width)

# Split the data file and repeat analyses
# with "aggregate"
# Compare groups on mean of one variable
aggregate(iris$Petal.Width ~ iris$Species, FUN = mean) # Tilda: As a function of

# Compare groups on several variables
# Use cbind (Column Bind) to list outcome variables
aggregate(cbind(iris$Petal.Width, iris$Petal.Length) ~
            iris$Species, FUN = mean)
# Need to remeber the order that you asked them. V1 is Width, V2 is Length
# Shows up in classification problems

rm(list = ls()) # Cleaning Up


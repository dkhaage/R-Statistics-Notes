# Ex06_01
# Basic Bivariate Associaction Plot - Creating bar charts of groups means
# Finding associations between variables Qualitaive & Quantitative

# Load data
?InsectSprays
spray <- InsectSprays # Load with shorter name

# To plot means, first get the means for the group
# Bar charts are used to working with summary data

means <- aggregate(spray$count ~ spray$spray, FUN = mean)
means
plot(means) # Gets lines for means

# To get a barplot, need to extract means and reoganize
mean.data <- t(means[-1]) # Removes first columns, transposes second (swap rows in dataset, like pivot)
colnames(mean.data) <- means[, 1] # Getting column names from means table

# Basic barplot for means
barplot(mean.data)

# Modify barplot
barplot(mean.data,
        col = "lightblue",
        main = "Effectiveness of Insect Sprays",
        xlab = "Spray Used",
        ylab = "Insect Count")

rm(list= ls()) # Cleaning Up

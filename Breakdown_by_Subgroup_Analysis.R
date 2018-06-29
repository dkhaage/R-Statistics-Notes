# Ex05_05
# Breakdown of data by analyzing Subgroups

# Load data
?ToothGrowth

aggregate(ToothGrowth$len ~ ToothGrowth$supp, FUN = mean)
aggregate(ToothGrowth$len ~ ToothGrowth$supp, FUN = median)

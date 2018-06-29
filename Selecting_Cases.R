# Ex05_01
# Selecting Cases - Great way to drill down into the data by looking at patterns that emerege in subsets

# Load data
?mtcars
data(mtcars)
mtcars

# Mean quarter-mile time (for all cars)
mean(mtcars$qsec)

# Mean quarter-mile time (for 8-cylinder cars)
# Use square brackets to indicate what to select
# in this format: [rows]
mean(mtcars$qsec[mtcars$cyl == 8]) # boolean operater

# Median horsepower (for all cars)
median(mtcars$hp)

# Mean MPG for cars above median horsepower
mean(mtcars$mpg[mtcars$hp > median(mtcars$hp)]) # square brackets indicate which rows you are selecting

# Create new data frame for 8-cylinder cars (subset)
# To create a new data frame, must indicate
# which rows and columns to copy in this
# Format: [rows, columns]. To select all
# Columns, leave second part blank.
cyl.8 <- mtcars[mtcars$cyl == 8, ]

# Select 8-cylinder cars with 4+ barrel carburetors (smaller subset)
mtcars[mtcars$cyl == 8 & mtcars$carb >= 4, ] # Note: do not need parenthasis

rm(list = ls()) # Clean Up

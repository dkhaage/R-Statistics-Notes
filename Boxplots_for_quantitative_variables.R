# EX02_04
# Creating boxplots for quantitative variables

# LOAD DATASET
require('datasets')
# Lawyers' Ratings of State Judges in the US Superior Court (c.1977)
?USJudgeRatings
USJudgeRatings # Rating Errors and Spelling Errors (Edit in external program like spreadsheat)

# Make boxplot using the defaults
boxplot(USJudgeRatings$RTEN) # Retention

?boxplot

# Modify boxplot
boxplot(USJudgeRatings$RTEN,
        horizontal = TRUE, # Same orientation as histogram
        las = 1, # Make all labels horizontal
        notch = TRUE, # Notches for CI for median
        ylim = c(0, 10), # Specify range on Y axis
        col = 'slategray3', # R's named colors (n = 657)
#        col = colors() [602], # R's color numbers
#        col = '#9FB6CD', # Hex codes for RGB triplet with max specified
        boxwex = 0.5, # Width of box as proportion of origional
        whisklty = 1, # Whisker line type; 1 = solid line
        staplelty = 0, # Staple (line at end) type; 0 = none
        outpch = 16, # Symbols for outliers; 16 = filled circle
        outcol = 'slategray3', # Color of outliers
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1977)",
        xlab = "Lawyers' Ratings") 

# Multiple boxplots
boxplot(USJudgeRatings,
        horizontal = TRUE, # Same orientation as histogram
        las = 1, # Make all labels horizontal
        notch = TRUE, # Notches for CI for median
        ylim = c(0, 10), # Specify range on Y axis
        col = 'slategray3', # R's named colors (n = 657)
        #        col = colors() [602], # R's color numbers
        #        col = '#9FB6CD', # Hex codes for RGB triplet with max specified
        boxwex = 0.5, # Width of box as proportion of origional
        whisklty = 1, # Whisker line type; 1 = solid line
        staplelty = 0, # Staple (line at end) type; 0 = none
        outpch = 16, # Symbols for outliers; 16 = filled circle
        outcol = 'slategray3', # Color of outliers
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1977)",
        xlab = "Lawyers' Ratings") 

rm(list = ls()) # Clean Up


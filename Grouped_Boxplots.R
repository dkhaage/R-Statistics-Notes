# Ex06_02
# Creating Grouped Box Plots
# Comparing groups on the same quantitative function

# Load Data
# Use dataset "painters" from the package
require(MASS)
?painters
data("painters")
painters

# Draw boxplots of outcome (Expression) by group (School)
# Basic version
boxplot(painters$Expression ~ painters$School)

# Modified version
require(RColorBrewer)
boxplot(painters$Expression ~ painters$School,
        col = brewer.pal(8, "Pastel2"),
         names = c("Renais.",
                  "Mannerist",
                  "Seicento",
                  "Venetian",
                  "Lombard",
                  "16th C.",
                  "17th c.",
                  "French"),
        # notch = TRUE # Not good because of small samples; don't use
        boxwex = 0.5, # Width of box
        whisklty = 1,# Whisker line type; 1 = solid line
        staplelty = 0, # Staple type; 0 = none
        outpch = 16, # Outlier symbol; 16 = filled circle
        outcol = brewer.pal(8, "Pastel2"), # Outlier
        main = "Expression Ratings of Painters by School\nFrom\"painters\" Dataset in \"MASS\" Package",
        xlab = "Painter's School",
        ylab = "Expression Ratings")

# Clean Up
detach("package:MASS", unload=TRUE)
detach("package:RColorBrewer", unload=TRUE)
rm(list=ls())

# Ex02_06
# Exporting Charts

# Load Data
require('datasets')
feeds <- table(chickwts$feed)

# The hard way : Via R's code

# For PNG file (Run entire block at once)
png(filename = "~/Desktop/Ex02_06a.png", #Open device
    width = 888, # Specify in Pixels
    height = 571)
par(oma = c(1,1,1,1)) # Sets outside margins: b, l, t, r
par(mar = c(4,5,2,1)) # Sets plot margins
barplot( feeds[order(feeds)], # Create the chart
         horiz = TRUE,
         las = 1, # las gives orientation of axis labels
         col = c('beige','blanchedalmond','bisque1','bisque2','bisque3','bisque4'), # Use BrewerPalette if you want
         border = NA, # No borders on bars
         main = 'Frequencies of Different Feeds\nin chickwts Dataset', # \n = line break
         xlab = 'Number of Chicks')
dev.off() #Close device(run in same block)


# OR this one for PDF file (Run entire block at once)
pdf("~/Desktop/Ex02_06b.pdf",
    width = 9,
    height = 6) # Specify in inches
par(oma = c(1,1,1,1)) # Sets outside margins: b, l, t, r
par(mar = c(4,5,2,1)) # Sets plot margins
barplot( feeds[order(feeds)],
         horiz = TRUE,
         las = 1, # las gives orientation of axis labels
         col = c('beige','blanchedalmond','bisque1','bisque2','bisque3','bisque4'), # Use BrewerPalette if you want
         border = NA, # No borders on bars
         main = 'Frequencies of Different Feeds\nin chickwts Dataset', # \n = line break
         xlab = 'Number of Chicks')
dev.off() #Close device(run in same block)

# The easy way: With RStudio "Export"

par(oma = c(1,1,1,1)) # Sets outside margins: b, l, t, r
par(mar = c(4,5,2,1)) # Sets plot margins
barplot( feeds[order(feeds)],
         horiz = TRUE,
         las = 1, # las gives orientation of axis labels
         col = c('beige','blanchedalmond','bisque1','bisque2','bisque3','bisque4'), # Use BrewerPalette if you want
         border = NA, # No borders on bars
         main = 'Frequencies of Different Feeds\nin chickwts Dataset', # \n = line break
         xlab = 'Number of Chicks')

rm(list = ls()) # Clean UP




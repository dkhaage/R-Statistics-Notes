# Ex01_10
# Exploring Color with Color Brewer

# Barplot
x = c(12,4,21,17,13,9)
barplot(x)

# RColorBrewer
browseURL('http://colorbrewer2.org/') # USes Flash
install.packages('RColorBrewer')

# Show all of the palettes in the graphics window 
display.brewer.all()

# to see palette colors in separate window, give number of desired colors and name of palette in quotes
display.brewer.pal(8,'Accent')
display.brewer.pal(4, 'Spectral')

# Barplots
# Can save palette as vector or call in function

blues <- brewer.pal(6, 'Blues')
barplot(x, col = blues)
barplot(x, col = brewer.pal(6,'Greens'))
barplot(x, col = brewer.pal(6,'YlOrRd'))
barplot(x, col = brewer.pal(6,'RdGy'))
barplot(x, col = brewer.pal(6,'BrBG'))
barplot(x, col = brewer.pal(6,'Dark2'))
barplot(x, col = brewer.pal(6,'Paired'))
barplot(x, col = brewer.pal(6,'Pastel2'))
barplot(x, col = brewer.pal(6,'Set3'))

# Clean up
palette('default') # Return to default
detach('package:RColorBrewer',unload = T)
rm(list =ls())

# Ex01_09
# Working with Color

# Barplot
x = c(12,4,21,17,13,9)
barplot(x)

# R specifies color in several ways
?colors
colors() # Gives list of color names

barplot(x, col = 'orange3')

# Color Numbers
# From color name's position in alphabetically-order vector of colors()
# Specify colors() [i], where i is index number vector

barplot(x, col = colors() [102]) # darkseagreen

# RGB Triplets
# Separatly specify the red, green, and blue components of the color
# By default, colors are specified in 0-1 range
# Can specify 0-225 range by adding "max = 225"
?rgb
# Can convert color names to rgb with 'col2rgb'
?col2rgb
col2rgb('navyblue') # yields (0, 0, 128)
barplot(x, col = rgb(.54, .0, .0)) # darkred
barplot(x, col = rgb(159, 182, 205, max = 255)) # Back to slategray

# RGB Hexcodes
# Can also use shortcut hexcodes (base 16), which are equivelent to
# RGB on the 0-255 scale, as FF in hex equals 255 in decimal
barplot(x, col = '#FFEBCD') # (blanchedalmond) if all were FF then would be white
barplot(x, col = '#9fB6CD') # Back to slategray3

# MULTIPLE COLORS
# Can specify several colors (using any coding method) in vector
barplot(x, col = c('red', 'blue')) # Colors will cycle
barplot(x, col = c('red', 'blue','green','yellow')) # Colors will cycle

# USING COLOR PALLETES
# Palettes can be can be more attractive and more informative
# Easiest to use

help(package=colorspace) # Lots of info on color spaces
?palette

# Built-in palettes
# rainbow(n, s = 1, v = 1, start = 0 , end = max(1, n-1)/n, alpha = 1)
# heat.colors(n, alpha = 1) # Yellow through red 
# Terrain.colors(n, alpha = 1) # Gray through green
# topo.colors(n, alpha = 1) # Purple through tan
# cm.colors(n, alpha = 1) # Blues and pinks

palette()

barplot(x, col = 1:6)
barplot(x, col = rainbow(6))
barplot(x, col = heat.colors(6))
barplot(x, col = terrain.colors(6))
barplot(x, col = topo.colors(6))
barplot(x, col = cm.colors(6))

rm(list = ls()) # Clean up









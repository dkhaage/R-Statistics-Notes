# Ex03_05
# Single categorical varibale: One sample chi-square test (Goodness of fit test)

# Load data
? HairEyeColor
str(HairEyeColor)
HairEyeColor

# Get marginal frequencies for eye color
margin.table(HairEyeColor, 2)

# Save eye color to data frame
eyes <- margin.table(HairEyeColor,2)
eyes
round(prop.table(eyes),2) # Show as proportions w/2 digits

# Use Pearson's chi-squared test
# Need one dimensional goodness-of-fit test
# Default test (assume equal distribution). Are the eye colors evenly distributed across the four categories?
chi1 <- chisq.test(eyes) # Save tests as object "chi1" 
chi1 # Check results

# Compare to population distribution
# Population data from:
browseURL("http://www.statisticbrain.com/eye-color-distribution-percentages/")
# Approximate proportions:
# Brown: .41 (Combining Brown Irises with Specks & Dark Brown Irises)
# Blue: .32 (Blue / Grey Irises)
# Hazel: .15 (Blue / Grey /Green Irises with Brown/ Yellow Specks)
# Green .12 (green / Light Brown Irises with Minimal Specks)
# p = c(.41, .32, .15, .12)
chi2 = chisq.test(eyes, p = c(.41, .32, .15, .12)) 
chi2 # Probability of getting the observed values is .09, therefore does not differ greatly

rm(list = ls()) # Clean up









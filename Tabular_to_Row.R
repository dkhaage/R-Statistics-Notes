# Ex01_08
# Converting tabular data to row data
# Counting cases, changed to rows and columns like a spreadsheat


# Load data
data("UCBAdmissions")
str(UCBAdmissions)
UCBAdmissions

# The Problem
admit.fail <- (UCBAdmissions$Admit) # Doesn't Work
barplot(UCBAdmissions$Admit) # Doesn't Work
plot(UCBAdmissions) # WORKS but not what we wanted now


# Get marginal frequencies from original table
margin.table(UCBAdmissions, 1) # Admit
margin.table(UCBAdmissions, 2) # Gender
margin.table(UCBAdmissions, 3) # Dept
margin.table(UCBAdmissions)    # Total

# Save marginals as new table
admit.dept<-margin.table(UCBAdmissions, 3) # Dept
str(admit.dept)
barplot(admit.dept)
admit.dept # Show Frequencies
round(prop.table(admit.dept),2)*100 # Show as proportions w/2 digits

# Go from table to one row per case
admit1<- as.data.frame.table(UCBAdmissions) # Coerces to data frame

admit2<- lapply(admit1, function(x)rep(x, admit1$Freq)) # Repeats each row by frequency

admit3<- as.data.frame(admit2) # Converts from list back to data frame

admit4<- admit3[,-4] # Removes fifth column with frequencies

#All at once
admit.rows <- as.data.frame(lapply(as.data.frame.table
(UCBAdmissions), function(x) rep(x, as.data.frame.table
(UCBAdmissions)$Freq)))[,-4]

str(admit.rows)
admit.rows[1:10,] # View first ten rows of data (of 4526)

rm(list =ls()) # Cleanup

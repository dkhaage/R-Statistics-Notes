# Ex05_03
# Merging files
# May need to add to existing data set when new information and observations come up
# Splitting and reconstituting

# Load data
?longley
data(longley)

# Split up longley
a1 <- longley[1:14, 1:6] # Starting data
a2 <- longley[1:14, 6:7] # New column to add (with "Year" to match)
b <- longley[15:16, ]    # New rows to add
write.table(a1, "longley.a1.txt", sep="\t")
write.table(a2, "longley.a2.txt", sep="\t")
write.table(b, "longley.b.txt", sep="\t")
rm(list = ls()) # Clear out everything to start fresh

# Import data
a1t <- read.table("longley.a1.txt", sep="\t")
a2t <- read.table("longley.a2.txt", sep="\t")

# Take early years (a1t) and add columns (a2t). Merge is for columns on an index
# Must specify variables to match cases (Remeber year appears in both)
a.1.2 <- merge(a1t, a2t, by = 'Year') # Merge two data frames
a.1.2 # Check Results

# Add two more cases at bottom. Rbind/Row Bind with the same column names
b<- read.table("longley.b.txt", sep = "\t")
all.data <- rbind(a.1.2,b) # "Row Bind"
row.names(all.data) <- NULL # Reset row names by making them NULL

rm(list = ls()) # Clean Up

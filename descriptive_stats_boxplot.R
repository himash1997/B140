# Load libraries
library(dplyr)

# Load and clean dataset
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA
df$confirmed <- as.numeric(df$confirmed)
df$group <- as.factor(df$group)

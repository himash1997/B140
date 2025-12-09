# Load and clean data
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA

df$confirmed <- as.numeric(df$confirmed)
df$group <- as.factor(df$group)

#package load
library(dplyr)

analysis_data <- df[, c("group", "confirmed")]

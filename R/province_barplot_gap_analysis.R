#dataset loading and get col values
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA
df$confirmed <- as.numeric(df$confirmed)
df$province <- as.factor(df$province)

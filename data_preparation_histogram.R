# load dataset
df <- read.csv("data/Case.csv")

# check structure
#str(df)
#names(df)

#Convert "-" to NA
df[df == "-"] <- NA

#Convert confirmed to numeric
df$confirmed <- as.numeric(df$confirmed)

#missing values
sum(is.na(df$confirmed))
sum(is.na(df$group))

#analysis dataset
analysis_data <- df[, c("group", "confirmed")]

#Convert group to factor / t-test
analysis_data$group <- as.factor(analysis_data$group)

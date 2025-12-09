#Load data
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA
df$confirmed <- as.numeric(df$confirmed)
df$group <- as.factor(df$group)

#Check normality for each group (Shapiro–Wilk)
shapiro_true <- shapiro.test(analysis_data$confirmed[analysis_data$group == "TRUE"])
shapiro_false <- shapiro.test(analysis_data$confirmed[analysis_data$group == "FALSE"])

shapiro_true
shapiro_false

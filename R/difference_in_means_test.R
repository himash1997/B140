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

#Perform Wilcoxon Rank-Sum Test (Non-parametric)
wilcox_result <- wilcox.test(confirmed ~ group, data = analysis_data, exact = FALSE)
wilcox_result


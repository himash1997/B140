# Load and clean data
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA

df$confirmed <- as.numeric(df$confirmed)
df$group <- as.factor(df$group)

#package load
library(dplyr)

analysis_data <- df[, c("group", "confirmed")]

# 1. Missing Value Report
missing_report <- sapply(df, function(x) sum(is.na(x)))
write.csv(missing_report, "output/missing_values_report.csv", row.names = TRUE)

# 2. Summary Table by Group
summary_table <- df %>%
  group_by(group) %>%
  summarise(
    count = n(),
    mean_confirmed = mean(confirmed, na.rm = TRUE),
    median_confirmed = median(confirmed, na.rm = TRUE),
    sd_confirmed = sd(confirmed, na.rm = TRUE)
  )

write.csv(summary_table, "output/summary_table_group.csv", row.names = FALSE)

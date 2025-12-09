# Load libraries
library(dplyr)

# Load and clean dataset
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA
df$confirmed <- as.numeric(df$confirmed)
df$group <- as.factor(df$group)

# Create analysis dataset
analysis_data <- df[, c("group", "confirmed")]

# ---- DESCRIPTIVE STATISTICS ----
stats <- analysis_data %>%
  group_by(group) %>%
  summarise(
    count = n(),
    mean_confirmed = mean(confirmed, na.rm = TRUE),
    median_confirmed = median(confirmed, na.rm = TRUE),
    sd_confirmed = sd(confirmed, na.rm = TRUE)
  )

print(stats)
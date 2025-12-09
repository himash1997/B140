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


# ---- BOXPLOT VISUALISATION ----
png("output/boxplot_group_confirmed_log.png", width = 1200, height = 800)

boxplot(log10(confirmed) ~ group,
        data = analysis_data,
        main = "Log-Scaled Boxplot of Confirmed Cases by Group",
        xlab = "Group (TRUE = Cluster Infection, FALSE = Isolated Infection)",
        ylab = "log10(Number of Confirmed Cases)",
        col = c("lightgreen", "lightblue"))

dev.off()


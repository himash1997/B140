#dataset loading and get col values
df <- read.csv("data/Case.csv", stringsAsFactors = FALSE)
df[df == "-"] <- NA
df$confirmed <- as.numeric(df$confirmed)
df$province <- as.factor(df$province)

#dplyr for data manipulation
library(dplyr)

province_stats <- df %>%
  group_by(province) %>%
  summarise(
    mean_confirmed = mean(confirmed, na.rm = TRUE),
    count = n()
  )

print(province_stats)

png("output/barplot_mean_confirmed_province.png", width = 1400, height = 900)

par(mar = c(12, 5, 4, 2))  # more space for labels

barplot(province_stats$mean_confirmed,
        names.arg = province_stats$province,
        las = 2,
        col = "skyblue",
        main = "Mean Confirmed COVID-19 Cases by Province",
        ylab = "Mean Number of Confirmed Cases",
        ylim = c(0, 700),
        cex.names = 0.8)   # shrink label size slightly,

#fix axis label manually BELOW the province names
mtext("Province", side = 1, line = 8, cex = 1.2)

dev.off()

#genarate barplot
png("output/barplot_mean_confirmed_province.png", width = 1400, height = 900)

par(mar = c(12, 5, 4, 2))  # more space for labels

barplot(province_stats$mean_confirmed,
        names.arg = province_stats$province,
        las = 2,
        col = "skyblue",
        main = "Mean Confirmed COVID-19 Cases by Province",
        ylab = "Mean Number of Confirmed Cases",
        ylim = c(0, 700),
        cex.names = 0.8)   # shrink label size slightly,

#fix axis label manually BELOW the province names
mtext("Province", side = 1, line = 8, cex = 1.2)

dev.off()

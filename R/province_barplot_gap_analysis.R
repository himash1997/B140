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
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

# Save histogram as PNG
png("output/histogram_confirmed.png", width = 1200, height = 800)

#Filter typical outbreaks only for visualization
filtered <- analysis_data$confirmed[analysis_data$confirmed < 500]
#max_val <- max(filtered, na.rm = TRUE)

h <- hist(filtered,
          breaks = 40,
          main = "Histogram of Confirmed COVID-19 Cases (< 500 Cases)",
          xlab = "Number of Confirmed Cases",
          ylab = "Frequency",
          col = "lightblue",
          border = "black",
          ylim = c(0, 100)
)

dev.off()
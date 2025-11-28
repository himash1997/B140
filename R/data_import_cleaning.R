# load dataset
df <- read.csv("data/transportation-fuels-inventory-beginning-2004-1.csv")

# check structure
#str(df)
#names(df)

#convert data types
df$Date <- as.Date(df$Date, tryFormats = c("%m/%d/%Y", "%d/%m/%Y"))
#str(df)

#missing values check and clean
sum(is.na(df))
sum(is.na(df[["U.S..Crude.Oil.Stocks..Thousand.Barrels."]]))
sum(is.na(df[["U.S..Gasoline.Stocks..Thousand.Barrels."]]))

#clean create dataset
crude <- df$`U.S..Crude.Oil.Stocks..Thousand.Barrels.`
gasoline <- df$`U.S..Gasoline.Stocks..Thousand.Barrels.`

fuel_data <- data.frame(Date = df$Date,
                        Crude = crude,
                        Gasoline = gasoline)

#checking
head(fuel_data)

###-------histogram for crude oil

# Save histogram as PNG
png("output/histogram_crude.png", width = 1200, height = 800)

#thousand barrels → million barrels:
fuel_data$Crude_million <- fuel_data$Crude / 1000

h <- hist(fuel_data$Crude, plot = FALSE)

hist(fuel_data$Crude,
     breaks = 40,
     main = "Histogram of U.S. Crude Oil Stocks",
     xlab = "Crude Oil Stocks (Thousand Barrels)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black",
     ylim = c(0, 150))

dev.off()

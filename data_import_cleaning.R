# load dataset
df <- read.csv("transportation-fuels-inventory-beginning-2004-1.csv")

# check structure
str(df)
names(df)

#convert data types
df$Date <- as.Date(df$Date, tryFormats = c("%m/%d/%Y", "%d/%m/%Y"))
#str(df)

#clean create dataset
crude <- df$`U.S..Crude.Oil.Stocks..Thousand.Barrels.`
gasoline <- df$`U.S..Gasoline.Stocks..Thousand.Barrels.`

fuel_data <- data.frame(Date = df$Date,
                        Crude = crude,
                        Gasoline = gasoline)

head(fuel_data)

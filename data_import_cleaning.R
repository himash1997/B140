# load dataset
df <- read.csv("transportation-fuels-inventory-beginning-2004-1.csv")

# check structure
str(df)

# covert Date column
df$Date <- as.Date(df$Date, format = "%m/%d/%Y")
str(df)
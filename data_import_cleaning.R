# load dataset
df <- read.csv("transportation-fuels-inventory-beginning-2004-1.csv")

# check structure
str(df)
names(df)

#convert data types
df$Date <- as.Date(df$Date, tryFormats = c("%m/%d/%Y", "%d/%m/%Y"))
#str(df)


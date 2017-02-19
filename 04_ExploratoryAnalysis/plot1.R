##plot1.R makes a histogram of global active power in kilowatts

## Clear workspace
rm(list = ls())

filename = "household_power_consumption.txt"

## Let's avoid reading the entire text file by just
## reading in the relevant rows

## First extract the variable names
featurenames = unlist(read.table(filename, sep = ";", 
                                 nrows = 1, stringsAsFactors=FALSE))
## Then extract the data for the dates February 1, 2007 to
## February 2, 2007
df = read.table(filename, sep = ";", nrows = 2880, skip = 66637)

## Name the features appropriately
library(data.table)
setnames(df, old = names(df), new = featurenames)

png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red")

dev.off()

## Alternative plotting
#dev.copy(png,'plot1.png')
#dev.off()
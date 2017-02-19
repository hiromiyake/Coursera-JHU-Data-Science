## plot2.R makes a time series plot of global active power
## in kilowatts over the entire two days (Thursday and Friday)

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

## Make a new character column with the date and time combined
df$datetime = paste(df$Date, df$Time)
## Remove the now-redundant "Date" and "Time" columns
df = subset(df, select = -c(Date,Time))
## Convert the date time column to a date class
df$datetime = strptime(df$datetime, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(df$datetime, df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
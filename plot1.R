## Setting working directory
setwd("E:/Coursera/4-Exploratory Data Analysis/Week 1/Project 1")

## Loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Loading lubridate library and manipulating Date and Time variables 
library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_active_power <- data$Global_active_power/500

## Specify the range of data of interest
dataRange <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"),]

## Plotting a histogram
hist(dataRange$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Creating PNG file
dev.copy(png, file = "plot1.png")
dev.off()

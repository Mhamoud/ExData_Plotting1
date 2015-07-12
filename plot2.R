## Setting working directory
setwd("E:/Coursera/4-Exploratory Data Analysis/Week 1/Project 1")

## Loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Loading lubridate library and manipulating Date and Time variables 
library(lubridate)
data["newTime"] <- NA
data$newTime <-  paste(data$Date, data$Time,sep = " ")
data$newTime <- strptime(data$newTime, "%d/%m/%Y %H:%M:%S" )
data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_active_power <- data$Global_active_power/500


## Specify the range of data of interest
dataRange <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"),]


## Creat Plot
plot(dataRange$newTime, dataRange$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", main = "Global Active Power", xlab = "")


## Creating PNG file
dev.copy(png, file = "plot2.png")
dev.off()

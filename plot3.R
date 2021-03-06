## Setting working directory
setwd("E:/Coursera/4-Exploratory Data Analysis/Week 1/Project 1")

## Loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Loading lubridate library and manipulating variables 
library(lubridate)
data["newTime"] <- NA
data$newTime <-  paste(data$Date, data$Time,sep = " ")
data$newTime <- strptime(data$newTime, "%d/%m/%Y %H:%M:%S" )
data$Date <- dmy(data$Date)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


## Specify the range of data of interest
dataRange <- data[data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"),]


## Creat Plot
png(file = "plot3.png", width = 480, height = 480)
par(bg = "white")
plot(dataRange$newTime,dataRange$Sub_metering_1, type = "l", ylab = "Energy Sub metering", main = "Global Active Power", xlab = "")
lines(dataRange$newTime, dataRange$Sub_metering_2, col="red")
lines(dataRange$newTime, dataRange$Sub_metering_3, col = "blue")

## Annotating graph
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty = 1, col = c("black","red","blue"))
dev.off()

# Load packages
library(tidyverse)
library(lubridate)

# Clean
rm(list = ls())

# Resd data
data <- read.table("household_power_consumption.txt",sep = ";",header = T)

# Set right format
data <- mutate(data,date_time=dmy_hms(paste(data$Date, data$Time, sep = " "), tz = "UTC"))
data <- mutate(data,Date=as.Date(data$Date,format="%d/%m/%Y"))

# Filter the data
sdata <- filter(data,Date=="2007-02-01"|Date=="2007-02-02")

# Plot
png("plot3.png", width = 480, height = 480)

plot(
  sdata$date_time,
  sdata$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(sdata$date_time, sdata$Sub_metering_2, col = "red")
lines(sdata$date_time, sdata$Sub_metering_3, col = "blue")
legend(
  "topright",
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  lwd = 1
)

dev.off()
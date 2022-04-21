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
png("plot2.png", width = 480, height = 480)
plot(
  sdata$date_time,
  sdata$Global_active_power,
  type = "l",
  ylab = "Global Active Power (kilowatts)"
)
dev.off()
library(data.table)
library(lubridate)

# Clean
rm(list = ls())

# Read data
data <- fread("household_power_consumption.txt", na.strings = "?")

# Filtering dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007") , ]

# Converting date column to date time
date_time <- dmy_hms(paste(data$Date, data$Time, sep = " "), tz = "UTC")

# Plot
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot1
plot(
  date_time,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Plot2
plot(
  date_time,
  data$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

# Plot3
plot(
  date_time,
  data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(date_time, data$Sub_metering_2, col = "red")
lines(date_time, data$Sub_metering_3, col = "blue")
legend(
  "topright",
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

# Plot4
plot(
  date_time,
  data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)

dev.off()
# Load packages
library(tidyverse)

# Clean
rm(list = ls())

# Resd data
data <- read.table("household_power_consumption.txt",sep = ";",header = T)

# Set right format
data <- mutate(data,Date=as.Date(data$Date,format="%d/%m/%Y"))
data <- mutate(data,Global_active_power=as.numeric(data$Global_active_power)) # note: NAs replace ? by coercion

# Filter the data
sdata <- filter(data,Date=="2007-02-01"|Date=="2007-02-02")

# Plot
png("plot1.png", width = 480, height = 480)
hist(
  sdata$Global_active_power,
  xlab = "Global Active Power (kilowatts)",
  ylab = "frequency",
  main = "Global Active Power",
  col = "Red"
)
dev.off()
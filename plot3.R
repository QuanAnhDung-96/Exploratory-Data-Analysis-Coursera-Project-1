# Coursera Assignment 1: Plot 3

# Quan Anh Dung

########################

## Load the data
rm(list = ls())
dat <- read.table("household_power_consumption.txt", header = T, 
                  sep = ";", na.strings = "?")

#subset the data
data <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert the date variable to Date class
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Build plot 3
data$datetime <- as.POSIXct(data$datetime)

attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)

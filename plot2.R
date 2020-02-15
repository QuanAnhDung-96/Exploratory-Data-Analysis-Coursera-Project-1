# Coursera Assignment 1: Plot 2

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

# Build plot 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (Kw)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)

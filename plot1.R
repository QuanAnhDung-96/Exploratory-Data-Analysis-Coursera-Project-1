# Coursera Assignment 1: Plot 1

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

# Build plot 1
attach(data)
hist(Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (Kw)", col = "Red", 
     ylim = c(0,1200))

# Save file
dev.copy(png, file= "plot1.png", height = 480, width = 480)
dev.off()
detach(data)


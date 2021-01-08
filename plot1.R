mywd <- "D:/Exploratory Data Analysis/Course Project 1"
setwd(mywd)

# Loading data:
data <- read.delim(file=paste0(getwd(), "/household_power_consumption.txt"), 
                   sep=";", colClasses = c(rep("character", 2), rep("numeric", 7)), 
                   na.strings="?")
data$Date <- strptime(data$Date, "%d/%m/%Y")

# Subsetting data:
data <- data[which(data$Date=="2007-02-01" | data$Date=="2007-02-02"),]

# Set PNG as graphic device:
png("./ExData_Plotting1/plot1.png", height = 640, width = 640)

# Make the histogram:
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Close the device to finalize the png file:
dev.off()
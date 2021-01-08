mywd <- "D:/Exploratory Data Analysis/Course Project 1"
setwd(mywd)

# Set Sys.locale to "english":
Sys.setlocale("LC_TIME", "English")

# Loading data:
data <- read.delim(file=paste0(getwd(), "/household_power_consumption.txt"), 
                   sep=";", colClasses = c(rep("character", 2), rep("numeric", 7)), 
                   na.strings="?")

# Convert Date to dates:
data$Date <- strptime(data$Date, "%d/%m/%Y")

# Subsetting data:
data <- data[which(data$Date=="2007-02-01" | data$Date=="2007-02-02"),]

# Create a new variable "DateTime"
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

# Set PNG as graphic device:
png("./ExData_Plotting1/plot2.png", height = 640, width = 640)

# Make the plot:
  plot(y=data$Global_active_power, x=data$DateTime,
       type="l", ylab="Global Active Power (kilowatts)", xlab = NA)

# Close the device to finalize the png file:
dev.off()
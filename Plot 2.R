# Plot 2
setwd("~/Documents/Data Science/Coursera/Module 4 Project 1")
HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
# Change Date Column to Date Type
HPC$Date <- as.Date(as.character(HPC$Date), "%d/%m/%Y")
# Filter Dates for 2007-02-01 and 2007-02-02
HPC <- HPC[HPC$Date >= "2007-02-01", ]
HPC <- HPC[HPC$Date <= "2007-02-02", ]
# Create Date/Time Column
HPC$DateTime <- strptime(paste(as.character(HPC$Date), HPC$Time), "%Y-%m-%d %H:%M:%S")

# Open graphic device
png("plot2.png", width=480, height=480)
# Generate Plot 2
plot(x = HPC$DateTime , y = HPC$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
# Close close device
dev.off()

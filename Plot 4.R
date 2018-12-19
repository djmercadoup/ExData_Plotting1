# Plot 4
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
png("plot4.png", width=480, height=480)

# Generate Plot 4
# Setup multi-plots
par(mfrow=c(2,2))

#subplot 1
plot(HPC$DateTime, HPC$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#subplot 2
plot(HPC$DateTime, HPC$Voltage, type="l", xlab="datetime", ylab="Voltage")

# subplot 3
plot(HPC$DateTime, HPC$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(HPC$DateTime, HPC$Sub_metering_2, col="red")
lines(HPC$DateTime, HPC$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), bty = "n", cex = .5)

#subplot 4
plot(HPC$DateTime, HPC$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

# Close close device
dev.off()


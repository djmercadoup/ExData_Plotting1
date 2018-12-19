# Plot 1
setwd("~/Documents/Data Science/Coursera/Module 4 Project 1")
HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
# Change Date Column to Date Type
HPC$Date <- as.Date(as.character(HPC$Date), "%d/%m/%Y")
# Filter Dates for 2007-02-01 and 2007-02-02
HPC <- HPC[HPC$Date >= "2007-02-01", ]
HPC <- HPC[HPC$Date <= "2007-02-02", ]
# Open graphic device
png("plot1.png", width=480, height=480)
# Generate Plot 1
hist(HPC$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# Close close device
dev.off()

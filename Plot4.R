library(data.table)



#Reads in data from file 
powerconsuption <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")


#Naming and subsetting power consumption data
names(powerconsuption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_C <- subset(powerconsuption,powerconsuption$Date=="1/2/2007" | powerconsuption$Date =="2/2/2007")


#str(subpower_C)
dateandtime <- strptime(paste(subpower_C$Date, subpower_C$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globActPow <- as.numeric(subpower_C$Global_active_power)
globReacPow <- as.numeric(subpower_C$Global_reactive_power)
voltage <- as.numeric(subpower_C$Voltage)
subMetering1 <- as.numeric(subpower_C$Sub_metering_1)
subMetering2 <- as.numeric(subpower_C$Sub_metering_2)
subMetering3 <- as.numeric(subpower_C$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateandtime, globActPow, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateandtime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateandtime, globReacPow, type="l", xlab="datetime", ylab="Global reactive power")

dev.off() 
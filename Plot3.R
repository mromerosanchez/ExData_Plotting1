library(data.table)



#Reads in data from file 
powerconsuption <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")


#Naming and subsetting power consumption data
names(powerconsuption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_C <- subset(powerconsuption,powerconsuption$Date=="1/2/2007" | powerconsuption$Date =="2/2/2007")


#str(subpower_C)
dateandtime <- strptime(paste(subpower_C$Date, subpower_C$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subpower_C$Sub_metering_1)
subMetering2 <- as.numeric(subpower_C$Sub_metering_2)
subMetering3 <- as.numeric(subpower_C$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateandtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, subMetering2, type="l", col="red")
lines(dateandtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 
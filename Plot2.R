library(data.table)



#Reads in data from file 
powerconsuption <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")


#Naming and subsetting power consumption data
names(powerconsuption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_C <- subset(powerconsuption,powerconsuption$Date=="1/2/2007" | powerconsuption$Date =="2/2/2007")

#str(subSetData)
#str(subSetData)
dateandtime <- strptime(paste(subpower_C$Date, subpower_C$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
G_A_P <- as.numeric(subpower_C$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateandtime, G_A_P, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

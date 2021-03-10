#Read Data
hpc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Convert variables and add new single variable
hpc$datetime = as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Time <- strptime(hpc$Time, format= "%H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")


#subset data to 2007-02-01 and 2007-02-02
feb <- subset(hpc, hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"))

#generate plot 4

#make Global_active_power numeric for plotting
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Set parameters
par(mfcol=c(2,2))

#Plot Graph 1
plot(feb$datetime, feb$Global_active_power, ylab="Global Active Power", xlab="",type="n")
lines(feb$datetime, feb$Global_active_power)

#Plot Graph 2
plot(feb$datetime, feb$Sub_metering_1, ylab="Energy sub metering", xlab="",type="n")
lines(feb$datetime, feb$Sub_metering_1)
lines(feb$datetime, feb$Sub_metering_2,col="red")
lines(feb$datetime, feb$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=.85)

#Plot Graph 3
plot(feb$datetime, feb$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(feb$datetime, feb$Voltage)

#Plot Graph 4
plot(feb$datetime, feb$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
lines(feb$datetime, feb$Global_reactive_power)

#Save as PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
#Read Data
hpc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Convert variables and add new single variable
hpc$datetime = as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Time <- strptime(hpc$Time, format= "%H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")


#subset data to 2007-02-01 and 2007-02-02
feb <- subset(hpc, hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"))

#generate plot 3

#make Global_active_power numeric for plotting
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Generate plot
plot(feb$datetime, feb$Sub_metering_1, ylab="Energy sub metering", xlab="",type="n")

#Add lines
lines(feb$datetime, feb$Sub_metering_1)
lines(feb$datetime, feb$Sub_metering_2,col="red")
lines(feb$datetime, feb$Sub_metering_3,col="blue")

#Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

#Save as PNG
dev.copy(png, file="plot3.png")
dev.off()
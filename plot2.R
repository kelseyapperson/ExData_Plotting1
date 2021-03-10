#Read Data
hpc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Convert variables and add new single variable
hpc$datetime = as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Time <- strptime(hpc$Time, format= "%H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")


#subset data to 2007-02-01 and 2007-02-02
feb <- subset(hpc, hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"))

#generate plot 2

#make Global_active_power numeric for plotting
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Generate plot
plot(feb$datetime, feb$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="n")

#Add lines
lines(feb$datetime, feb$Global_active_power)


#Save as PNG
dev.copy(png, file="plot2.png")
dev.off()
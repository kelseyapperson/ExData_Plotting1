#Read Data
hpc <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Convert variables
hpc$Time <- strptime(hpc$Time, format= "%H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#subset data to 2007-02-01 and 2007-02-02
feb <- subset(hpc, hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"))

#generate plot 1

#make Global_active_power numeric for plotting
feb$Global_active_power <- as.numeric(feb$Global_active_power)

#Generate histogram
hist(feb$Global_active_power, col= "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#Save as PNG
dev.copy(png, file="plot1.png")
dev.off()
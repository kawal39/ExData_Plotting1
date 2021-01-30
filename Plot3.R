# Read data
PowerConData <- read.table(file = "household_power_consumption.txt", 
                           header = TRUE, sep = ";")

# Extract dates needed (2007-02-01 and 2007-02-02)
SubPowerCon <- subset(PowerConData,PowerConData$Date == "1/2/2007" | 
                        PowerConData$Date == "2/2/2007")

# Convert date and time variables
SubPowerCon$Date <- as.Date(SubPowerCon$Date, format = "%d/%m/%Y")
SubPowerCon$Time <- strptime(SubPowerCon$Time, format = "%H:%M:%S")
SubPowerCon[1:1440,"Time"] <- format(SubPowerCon[1:1440,"Time"],"2007-02-01 %H:%M:%S")
SubPowerCon[1441:2880,"Time"] <- format(SubPowerCon[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Open png graphic device
png(filename = "Plot3.png", width = 480, height = 480, units = "px")

# Create basic plot system
with(SubPowerCon, plot(Time,Sub_metering_1, type = "n", 
                       xlab = "", ylab = "Energy sub netering"))

# Add sub metering lines to graph
with(SubPowerCon, lines(Time,as.numeric(Sub_metering_1), col = "black"))
with(SubPowerCon, lines(Time,as.numeric(Sub_metering_2), col = "red"))
with(SubPowerCon, lines(Time,as.numeric(Sub_metering_3), col = "blue"))

# Add the legend
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close png graphic devide
dev.off()
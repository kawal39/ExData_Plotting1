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
png(filename = "Plot2.png", width = 480, height = 480, units = "px")

# Create basic plot system
with(SubPowerCon, plot(Time,as.numeric(Global_active_power), type = "l", 
                       xlab = "", ylab = "Global Active Power (kilowatts)"))


# Close png graphic devide
dev.off()
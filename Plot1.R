# Read data
PowerConData <- read.table(file = "household_power_consumption.txt", 
                           header = TRUE, sep = ";")

# Extract dates needed (2007-02-01 and 2007-02-02)
SubPowerCon <- subset(PowerConData,PowerConData$Date == "1/2/2007" | 
                        PowerConData$Date == "2/2/2007")

# Open png graphic device
png(filename = "Plot2.png", width = 480, height = 480, units = "px")

# Create histogram
with(SubPowerCon, hist(as.numeric(Global_active_power),col = "red",
                       main = "Global Active Power", 
                       xlab = "Global Active Power (kilowatts)"))

# Close png graphic devide
dev.off()
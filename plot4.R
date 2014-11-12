# File in WD

# Convert to Table(Easy way)
header <- as.vector(t(read.table("household_power_consumption.txt", 
                                 sep = ";", 
                                 nrows = 1)))

mydata <- read.table("household_power_consumption.txt", 
                     sep = ";", 
                     col.names = header, 
                     nrows = 2880, 
                     skip = 66637)

# Convert Dates
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

# Plot 1
plot(mydata$DateTime, mydata$Global_active_power,
     type="l", #type = line
     xlab="", #x-axis label
     ylab="Global active power", #y-axis label
     col="black") #color

# Plot 2
plot(mydata$DateTime, mydata$Voltage,
     type="l", #type = line
     xlab="datetime", #x-axis label
     ylab="Voltage", #y-axis label
     col="black") #color

# Plot 3
plot(mydata$DateTime, mydata$Sub_metering_1,
     type="l", #type = line
     xlab="", #x-axis label
     ylab="Energy sub metering", #y-axis label
     col="black") #color
points(mydata$DateTime, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$DateTime, mydata$Sub_metering_3, type = "l", col = "blue")
legend( x="topright",
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"), 
        lty=c(1,1,1))

# Plot 4
plot(mydata$DateTime, mydata$Global_reactive_power,
     type="l", #type = line
     xlab="datetime", #x-axis label
     ylab="Voltage", #y-axis label
     col="black") #color

# Save png Image file
dev.copy(png, file = "plot4.png")
dev.off()

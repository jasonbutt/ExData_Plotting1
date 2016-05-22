# Set data file and read into table
pwrdatafile <- "household_power_consumption.txt"
print("reading data file ...")
pwrdata <- read.table(pwrdatafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the power data for the two days
print("Subsetting data file ...")
subpwrdata <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subpwrdata$Date, subpwrdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(subpwrdata$Global_active_power)
reactivepower <- as.numeric(subpwrdata$Global_reactive_power)
voltage <- as.numeric(subpwrdata$Voltage)
submeter1 <- as.numeric(subpwrdata$Sub_metering_1)
submeter2 <- as.numeric(subpwrdata$Sub_metering_2)
submeter3 <- as.numeric(subpwrdata$Sub_metering_3)

# Open the file graphics device
print("Plotting to PNG ...")
png("plot4.png", width=480, height=480)
# Set the active graphic device to 2 rows and 2 columns
par(mfrow = c(2,2))
print("Plotting Active Power ...") # Plot to first panel (1,1)
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

print("Plotting Voltage ...") # Plot to second panel (1,2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

print("Plotting Energy Submetering ...")
# Plot line chart using type='l" for lines, Plot to third panel (2,1)
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
# Add lines 2nd and 3rd lines
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

print("Plotting Reactive Power ...") # Plot to fourth panel (2,2)
plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
#Close the file graphics device
print("Closing PNG ...")
dev.off() 
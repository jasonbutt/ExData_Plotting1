# Set data file and read into table
pwrdatafile <- "household_power_consumption.txt"
print("reading data file ...")
pwrdata <- read.table(pwrdatafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the power data for the two days
print("Subsetting data file ...")
subpwrdata <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subpwrdata$Date, subpwrdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(subpwrdata$Global_active_power)
submeter1 <- as.numeric(subpwrdata$Sub_metering_1)
submeter2 <- as.numeric(subpwrdata$Sub_metering_2)
submeter3 <- as.numeric(subpwrdata$Sub_metering_3)

# Open the file graphics device
print("Plotting to PNG ...")
png("plot3.png", width=480, height=480)
# Plot line chart using type='l" for lines
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
# Add lines 2nd and 3rd lines
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Close the file graphics device
print("Closing PNG ...")
dev.off() 
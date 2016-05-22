# Set data file and read into table
pwrdatafile <- "household_power_consumption.txt"
print("reading data file ...")
pwrdata <- read.table(pwrdatafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the power data for the two days
print("Subsetting data file ...")
subpwrdata <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]
globalpower <- as.numeric(subpwrdata$Global_active_power)

# Open the file graphics device
print("Plotting to PNG ...")
png("plot1.png", width=480, height=480)
hist(globalpower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the file graphics device
print("Plotting to PNG ...")
dev.off() 
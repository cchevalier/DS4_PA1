# plot1.R: Histogram of Global Active Power


# load all data
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# subset all data to required period
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

# Create real DateTime 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)



# Plot1: histogram

# Use of png() for better rendering as suggested in discussion forum
png(file="plot1.png", bg="transparent", height=480, width=480)

par(mfrow=c(1,1))
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

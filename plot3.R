# plot3.R: TS plot of sub metering 1, 2 & 3


# load all data
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# subset all data to required period
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

# Create real DateTime 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)



# Plot3: TS plot of sub metering 1, 2 & 3

# Use of png() for better rendering as suggested in discussion forum
png(file="plot3.png", bg="transparent", height=480, width=480)

par(mfrow=c(1,1))
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

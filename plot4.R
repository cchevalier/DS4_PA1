# plot4.R: Collections of 4 subplots


# load all data
alldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# subset all data to required period
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

# Create real DateTime 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)



# Plot4: Collections of 4 subplots

# Use of png() for better rendering as suggested in discussion forum
png(file="plot4.png", bg="transparent", height=480, width=480) 

par(mfrow = c(2, 2))

with(data, {
  # 1
  plot(Global_active_power~Datetime, type ="l", ylab = "Global Active Power", xlab = "")

  # 2
  plot(Voltage~Datetime, type ="l", ylab = "Voltage", xlab = "datetime")
  
  # 3
  plot(Sub_metering_1~Datetime, type="l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  
  # 4
  plot(Global_reactive_power~Datetime, type="l", xlab="datetime")
})

dev.off()

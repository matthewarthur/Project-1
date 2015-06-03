setwd('C:\\Users\\Arthurml\\R-3.0.2\\EDA')

#key is to remove the ?s
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#data.Days <- data[which (data$Date == "2007-02-01" | data$Date == '2007-02-02),]
# wrong syntax somewhere, using subset instead

data.Days <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#combine date and time as datetime, render it a useful format
datetime <- paste(as.Date(data.Days$Date), data.Days$Time)
data.Days$Datetime <- as.POSIXct(datetime)

#hist(data.Days$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (KW)", ylab = "Frequency", col = "Red")

png(file = "Plot4.png", width = 480, height = 480)

attach(data.Days)

#Configure for a 2 X 2 display
par(mfrow=c(2,2))

plot(Datetime, as.numeric(as.character(Global_active_power)), type="l", xlab="Day", ylab="Global Active Power")
plot(Datetime, as.numeric(as.character(Voltage)), type="l", xlab="Date Time", ylab="Voltage")
plot(Datetime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy Sub Metering", ylim=c(0,40))
lines(Datetime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(Datetime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering_3" ))
plot(Datetime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="Date Time", ylab="Global Reactive Power")

#Close the output and finalize file
dev.off()

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

png(file = "Plot3.png", width = 480, height = 480)

attach(data.Days)
plot(Datetime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="Day", ylab="Energy sub metering", ylim=c(0,40))
lines(Datetime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(Datetime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()

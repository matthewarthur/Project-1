

#key is to remove the ?s

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")



#data.Days <- data[which (data$Date == "2007-02-01" | data$Date == '2007-02-02),]

# wrong syntax somewhere, using subset instead



data.Days <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")



#combine date and time as datetime, render it a useful format

datetime <- paste(as.Date(data.Days$Date), data.Days$Time)

data.Days$Datetime <- as.POSIXct(datetime)



hist(data.Days$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (KW)", ylab = "Frequency", col = "Red")
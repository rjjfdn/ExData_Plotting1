data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data = data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
data = transform(data, Global_active_power = as.numeric(Global_active_power))

data$Date = paste(data$Date, data$Time, sep=" ")
data$Date = strptime(data$Date, format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(data$Date, data$Global_active_power, ylab="Global Active Power", pch=".", type="o", xlab="", cex=0.8)

plot(data$Date, data$Voltage, ylab="Voltage", pch=".", type="o", xlab="datetime", cex=0.8)

plot(data$Date, data$Sub_metering_1, xlab="", ylab="Energy sub metering", pch="", type="o", cex=0.8)
lines(data$Date, data$Sub_metering_2, pch="", type="o", col="red")
lines(data$Date, data$Sub_metering_3, pch="", type="o", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.5)

plot(data$Date, data$Global_reactive_power, ylab="Global_reactive_power", pch=".", type="o", xlab="datetime", cex=0.8)

dev.copy(png, 'plot4.png')
dev.off()
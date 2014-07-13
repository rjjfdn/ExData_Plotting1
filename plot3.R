data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data = data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
data = transform(data, Global_active_power = as.numeric(Global_active_power))

data$Date = paste(data$Date, data$Time, sep=" ")
data$Date = strptime(data$Date, format="%d/%m/%Y %H:%M:%S")

plot(data$Date, data$Sub_metering_1, xlab="", ylab="Energy sub metering", pch="", type="o")
lines(data$Date, data$Sub_metering_2, pch="", type="o", col="red")
lines(data$Date, data$Sub_metering_3, pch="", type="o", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.5)

dev.copy(png, 'plot3.png')
dev.off()
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data = data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
data = transform(data, Global_active_power = as.numeric(Global_active_power))

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", cex=0.5, cex.main=1)

dev.copy(png, 'plot1.png')
dev.off()
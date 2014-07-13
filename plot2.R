data = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data = data[data$Date %in% c("2/2/2007", "1/2/2007"), ]
data = transform(data, Global_active_power = as.numeric(Global_active_power))

data$Date = paste(data$Date, data$Time, sep=" ")
data$Date = strptime(data$Date, format="%d/%m/%Y %H:%M:%S")

plot(data$Date, data$Global_active_power, ylab="Global Active Power (kilowatts)", pch=".", type="o", xlab="")

dev.copy(png, 'plot2.png')
dev.off()
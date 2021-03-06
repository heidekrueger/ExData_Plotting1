##load the date
header <- read.table('data//household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.csv("data//household_power_consumption.txt", skip=66636, nrows = 2880, sep = ';')
colnames( data ) <- unlist(header)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


##windows(width=8,height = 8, xpinch=60, ypinch=60)
par(cex=.65, mfrow =c(2,2))

##topleft
with(data, plot(DateTime, Global_active_power, type='l', ylab = 'Global Active Power (kW)', xlab = ''))

##topright

with(data, plot(DateTime, Voltage, type='l'))
##bottomleft

with(data, 
     plot(DateTime, Sub_metering_1,
          type='l', ylab = 'Energy Sub Metering', xlab = ''))
with(data,lines(DateTime, Sub_metering_2, type='l', col = 'red'))
with(data, lines(DateTime, Sub_metering_3, type='l', col = 'blue'))
legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## bottomright

with(data, plot(DateTime, Global_reactive_power, type='l'))


dev.copy(device = png, file = 'plot4.png', width = 480, height = 480)
dev.off()
header <- read.table('data//household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
data <- read.csv("data//household_power_consumption.txt", skip=66636, nrows = 2880, sep = ';')
colnames( data ) <- unlist(header)
data$Date = strptime(data$Date, '%d/%m/%Y')
GA <- data$Global_a
#GA <- as.numeric(levels(GA))[GA]
hist(GA,
     col='red',
     xlab = 'Global Active Power (kW)',
     main = 'Global Active Power')
dev.copy(device = png, file = 'plot1.png', width = 480, height = 480)
dev.off()
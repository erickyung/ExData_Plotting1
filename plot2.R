firstRow <- read.table("./household_power_consumption.txt", sep = ";", nrows = 1)
header <- as.character(unname(unlist(firstRow[1, ])))

data <- read.table("./household_power_consumption.txt",
                   sep = ";", skip = 66637, nrows = 2881)
colnames(data) <- header
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", bg = "transparent", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
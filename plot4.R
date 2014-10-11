firstRow <- read.table("./household_power_consumption.txt", sep = ";", nrows = 1)
header <- as.character(unname(unlist(firstRow[1, ])))

data <- read.table("./household_power_consumption.txt",
                   sep = ";", skip = 66637, nrows = 2881)
colnames(data) <- header
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", bg = "transparent", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", lwd = 2, bty = "n",
         col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
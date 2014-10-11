firstRow <- read.table("./household_power_consumption.txt", sep = ";", nrows = 1)
header <- as.character(unname(unlist(firstRow[1, ])))

data <- read.table("./household_power_consumption.txt",
                   sep = ";", skip = 66637, nrows = 2880)
colnames(data) <- header

png(filename = "plot1.png", bg = "transparent", width = 480, height = 480)
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")
dev.off()
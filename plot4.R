EPC <- read.table(
        "household_power_consumption.txt", sep = ";", 
         header = TRUE, stringsAsFactors = F)

EPC2 <- head(EPC)

EPC$Sub_metering_1 <- as.numeric(EPC$Sub_metering_1)
EPC$Sub_metering_2 <- as.numeric(EPC$Sub_metering_2)
EPC$Global_intensity <- as.numeric(EPC$Global_intensity)
EPC$Voltage <- as.numeric(EPC$Voltage)
EPC$Global_reactive_power <- as.numeric(EPC$Global_reactive_power)
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")
EPC$Time <- strptime(EPC$Time,"%H:%M:%S")


subEPC <- EPC[EPC$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]



par(mfrow = c(2,2))



plot(subEPC$Global_active_power, type = "l", ylab = 
                "Global Active Power (kilowatts)", xlab = "", xaxt = "n")


axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot(subEPC$Voltage, type = "l", ylab = 
             "Voltage", xlab = "datetime", xaxt = "n")

axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot(subEPC$Sub_metering_1, type = "l", ylab = 
             "Energy sub metering", xlab = "", xaxt = "n")

lines(subEPC$Sub_metering_2, col = "red")
lines(subEPC$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col = c("black", "red", "blue"), text.width =1800, bty = "n")

axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot(subEPC$Global_reactive_power, type = "l", ylab = 
             "Global Reactive Power (kilowatts)", xlab = "", xaxt = "n")

axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))




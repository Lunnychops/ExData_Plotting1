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

par(mfrow = c(1,1))
plot(subEPC$Global_active_power, type = "l", ylab = 
                "Global Active Power (kilowatts)", xlab = "", xaxt = "n")


axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))



dev.copy(png, "plot2.png")
dev.off()
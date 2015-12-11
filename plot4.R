

Dt <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", nrow = 2075259, stringsAsFactors = F )

Dt1 <- subset(Dt, Date %in% c("1/2/2007", "2/2/2007"))


Dt1$DateTime <- strptime(paste(Dt1$Date, Dt1$Time), format = "%d/%m/%Y %H:%M:%S")

colnames(Dt1)

op <- par(mfrow = c(2, 2))


plot(Dt1$DateTime, Dt1$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(Dt1$DateTime, Dt1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")



plot(Dt1$DateTime, Dt1$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(Dt1$DateTime, Dt1$Sub_metering_2, col = "red")
lines(Dt1$DateTime, Dt1$Sub_metering_3, col = "blue")
text(as.POSIXlt("2007-02-02 13:30:00"), 38, labels = c("--- Sub_metering_1"), cex = 0.6, col = c("black"))
text(as.POSIXlt("2007-02-02 13:30:00"), 34, labels = c("--- Sub_metering_2"), cex = 0.6, col = c("red"))
text(as.POSIXlt("2007-02-02 13:30:00"), 30, labels = c("--- Sub_metering_3"), cex = 0.6, col = c("blue"))

plot(Dt1$DateTime, Dt1$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()



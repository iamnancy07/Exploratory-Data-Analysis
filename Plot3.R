

Dt <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", nrow = 2075259, stringsAsFactors = F )

Dt1 <- subset(Dt, Date %in% c("1/2/2007", "2/2/2007"))


Dt1$DateTime <- strptime(paste(Dt1$Date, Dt1$Time), format = "%d/%m/%Y %H:%M:%S")

colnames(Dt1)



plot(Dt1$DateTime, Dt1$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(Dt1$DateTime, Dt1$Sub_metering_2, col = "red")
lines(Dt1$DateTime, Dt1$Sub_metering_3, col = "blue")
text(as.POSIXlt("2007-02-02 14:30:00"), 38, labels = c("--- Sub_metering_1"), col = c("black"))
text(as.POSIXlt("2007-02-02 14:30:00"), 36, labels = c("--- Sub_metering_2"), col = c("red"))
text(as.POSIXlt("2007-02-02 14:30:00"), 34, labels = c("--- Sub_metering_3"), col = c("blue"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

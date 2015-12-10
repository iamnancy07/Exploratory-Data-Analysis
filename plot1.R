
Dt <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", nrow = 2075259, stringsAsFactors = F )

Dt1 <- subset(Dt, Date %in% c("1/2/2007", "2/2/2007"))


Dt1$DateTime <- strptime(paste(Dt1$Date, Dt1$Time), format = "%d/%m/%Y %H:%M:%S")

colnames(Dt1)

hist(Dt1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

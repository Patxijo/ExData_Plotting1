
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, 
                   na.strings = "?")

#My format date is in Spanish, day, month, year
##jue, vie, sáb == thu fri sat

subdata <- subset(data, Date == c("1/2/2007") | Date == c("2/2/2007"))

subdata$Date_Time <- as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S") 

##Plot4

par(mfrow= c(2,2), mar=c(4,4,0.5,0.5))

plot(subdata$Date_Time, subdata$Global_active_power,  type = "l", ylab = "Global Active Power",
     xlab = "", bg = "transparent" )

plot(subdata$Date_Time, subdata$Voltage,  type = "l", ylab = "Voltage",
     xlab = "datetime", bg = "transparent" )

plot(subdata$Date_Time, subdata$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "" , lty = 1, bg = "transparent")
lines(subdata$Date_Time, subdata$Sub_metering_2, col = "red", lty = 1, bg = "transparent")
lines(subdata$Date_Time, subdata$Sub_metering_3, col = "blue", lty = 1, bg = "transparent")
legend("topright", legend = c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), lty = 1, 
       pt.cex = 1, cex = 0.65, adj = c(0.07, 0.5), bty = "n", col = c("black", "red", "blue"))

plot(subdata$Date_Time, subdata$Global_reactive_power,  type = "l", ylab = "Global Reactive Power",
     xlab = "datetime", bg = "transparent" )

dev.copy(png, file = "Plot4.png")
dev.off()

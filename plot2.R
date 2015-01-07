
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, 
                   na.strings = "?")

#My format date is in Spanish, day, month, year
##jue, vie, sáb == thu fri sat

subdata <- subset(data, Date == c("1/2/2007") | Date == c("2/2/2007"))

subdata$Date_Time <- as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S") 

##Plot2

plot(subdata$Date_Time, subdata$Global_active_power,  type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "", bg = "transparent" )

dev.copy(png, file = "Plot2.png")
dev.off()



data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, 
                   na.strings = "?")

#My format date is in Spanish, day, month, year

subdata <- subset(data, Date == c("1/2/2007") | Date == c("2/2/2007"))

subdata$Date_Time <- as.POSIXct(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S") 

##Plot1

hist(subdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", bg = "transparent")

dev.copy(png, file = "Plot1.png")
dev.off()




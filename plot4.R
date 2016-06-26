data <- read.table("power.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
subdata <-data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subdata$Global_active_power)
s1 <- as.numeric(subdata$Sub_metering_1)
s2 <- as.numeric(subdata$Sub_metering_2)
s3 <- as.numeric(subdata$Sub_metering_3)
v <- as.numeric(subdata$Voltage)
grp <- as.numeric(subdata$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))

plot(datetime,gap,type="l",xlab="",ylab = "Global Active Power")

plot(datetime,s1,type="l",xlab="",ylab = "Energy sub metering")
lines(datetime, s2, type="l", col="red")
lines(datetime, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

plot(datetime,v,type="l",ylab = "Voltage")

plot(datetime,grp,type="l",ylab = "Global_reactive_power")

dev.off()
library("dplyr")
library("data.table")
library("ggplot2")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

h_p_c <- tbl_df(data)

datos <- mutate(h_p_c, Date1 = as.character(Date))

infoplot<- filter(datos, Date1 == "1/2/2007" | Date1 =="2/2/2007")

#Plot 1

hist(infoplot$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

#Plot 2

datetime <- strptime(paste(infoplot$Date1, infoplot$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

plot(datetime, infoplot$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

png("plot2.png", width=480, height=480)
dev.off()

#Plot 3

with(infoplot,
     {plot(datetime, Sub_metering_1, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
       lines(datetime, Sub_metering_2, col="red")
       lines(datetime, Sub_metering_3, col="blue")})
legend("topright", cex = 0.5, col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saving the plot
png("plot3.png", width=480, height=480)
dev.off()

#Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(infoplot, {
  plot(datetime, infoplot$Global_active_power, 
       type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(datetime, infoplot$Voltage, 
       type="l", xlab="datetime", ylab="Voltage")
  plot(datetime, Sub_metering_1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", cex = 0.5, col=c("black", "red", "blue"), 
         lty=1, lwd=1, bty = "n",
         legend=c("Sub_metering_1",
                  "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, infoplot$Global_reactive_power, type ="l", 
       ylab="Global Rective Power (kilowatts)", xlab ="")})

#saving the plot
png("plot4.png", width=480, height=480)
dev.off()

library("dplyr")
library("data.table")
library("ggplot2")

data <- read.table("household_power_consumption.txt", 
                   sep = ";", header = TRUE, na.strings = "?")
head(data)

h_p_c <- tbl_df(data)

datos <- mutate(h_p_c, Date1 = as.character(Date))

infoplot<- filter(datos, Date1 == "1/2/2007" | Date1 =="2/2/2007")

#Plot 2

datetime <- strptime(paste(infoplot$Date1, infoplot$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S")

plot(datetime, infoplot$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

#saving the plot
png("plot2.png", width=480, height=480)
dev.off()

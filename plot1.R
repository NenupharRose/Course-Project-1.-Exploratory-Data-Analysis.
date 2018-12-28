library("dplyr")
library("data.table")
library("ggplot2")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
head(data)

h_p_c <- tbl_df(data)

datos <- mutate(h_p_c, Date1 = as.character(Date))

infoplot<- filter(datos, Date1 == "1/2/2007" | Date1 =="2/2/2007")

#Plot 1: Global Active Power

hist(infoplot$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

#saving the plot
png("plot1.png", width = 480, height = 480)

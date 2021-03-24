createPlot1 <- function(){
  
#library(readr)
  
par(mfrow=c(1,1))

plot_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

plot_data <- subset(plot_data, Date=="1/2/2007" | Date=="2/2/2007")

plot_data$Date <- as.Date(plot_data$Date)  
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)  
plot_data$Global_reactive_power <- as.numeric(plot_data$Global_reactive_power)  
plot_data$Voltage <- as.numeric(plot_data$Voltage)  
plot_data$Global_intensity <- as.numeric(plot_data$Global_intensity) 
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1) 
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2) 
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3) 

##View(plot_data)

##return


hist(plot_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

dev.copy(png, 'plot1.png', )

dev.off()


}


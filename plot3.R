createPlot3 <- function(){
  
par(mfrow=c(1,1))

plot_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

plot_data <- subset(plot_data, Date=="1/2/2007" | Date=="2/2/2007")

plot_data$Time <- strptime(paste(plot_data$Date, plot_data$Time), format="%d/%m/%Y %H:%M:%S")
##plot_data$Time <- as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%d/%m/%Y %H:%M:%S")
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)  
plot_data$Global_reactive_power <- as.numeric(plot_data$Global_reactive_power)  
plot_data$Voltage <- as.numeric(plot_data$Voltage)  
plot_data$Global_intensity <- as.numeric(plot_data$Global_intensity) 
plot_data$Sub_metering_1 <- as.numeric(plot_data$Sub_metering_1) 
plot_data$Sub_metering_2 <- as.numeric(plot_data$Sub_metering_2) 
plot_data$Sub_metering_3 <- as.numeric(plot_data$Sub_metering_3) 

##View(plot_data)

##return

with(plot_data, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))

with(plot_data, points(Time, Sub_metering_2, col="red", type="l"))

with(plot_data, points(Time, Sub_metering_3, col="blue", type="l"))

axis(1,                                                   # Add dates to x-axis
     plot_data$Date,
     format( plot_data$Date, "%Y-%m-%d"))

text =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

legend("topright",text,col=c("black", "red","blue"), lty=1,
       text.width = strwidth(text)[1]*1.6)


dev.copy(png, 'plot3.png', )

dev.off()


}


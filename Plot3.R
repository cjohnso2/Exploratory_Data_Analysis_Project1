#Set Working Directory
setwd("\\\\cscphome/HOME1/CJOHNSO2/Redir-cjohnso2/Documents/ExploratoryDataAnalysis")
#Load data into R
Power_con <- "./ExploratoryDataAnalysis/household_power_consumption.txt"
data <- read.table(Power_con, header=T, sep=';', na.strings="?")

#Extract only the dates we need for plot
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Seperate data to plot 3 cases
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#Plot in device 
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Close outside device
dev.off()
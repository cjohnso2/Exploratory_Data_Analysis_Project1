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

#Plot in Device
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close outside device
dev.off()
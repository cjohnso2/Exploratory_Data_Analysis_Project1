#Set Working Directory
setwd("\\\\cscphome/HOME1/CJOHNSO2/Redir-cjohnso2/Documents/ExploratoryDataAnalysis")
#Load data into R
Power_con <- "./ExploratoryDataAnalysis/household_power_consumption.txt"
data <- read.table(Power_con, header=T, sep=';', na.strings="?")

#Extract only the dates we need for plot
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Plot in Device
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close outside device
dev.off()
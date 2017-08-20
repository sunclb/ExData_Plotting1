##plot1 script

library(lubridate)
#read data file
alldata<-read.table("household_power_consumption.txt",sep=";",
                    na.strings="?",header = TRUE)
#format date and time
alldata$Date<-dmy(alldata$Date)
alldata$Time<-hms(alldata$Time)

#subset data containing only 2007-02-01 and 2007-02-02 data
subdata<-subset(alldata,Date>="2007-02-01"&Date<="2007-02-02")

#plot
png(filename="plot1.png",width = 480, height = 480)
hist(subdata$Global_active_power,main="Global Active Power",
     xlab="Global Active Power(kilowatts)",col="red")
dev.off()
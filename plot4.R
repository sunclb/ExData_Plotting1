##plot4 script

library(lubridate)
library(dplyr)
#read data file
alldata<-read.table("household_power_consumption.txt",sep=";",
                    na.strings="?",header = TRUE)
#combine date &time
datetime<-dmy_hms(paste(alldata$Date,alldata$Time))

#add datetime to alldata table
alldata<-alldata%>%mutate(datetime=datetime)


#subset data containing only 2007-02-01 and 2007-02-02 data
subdata<-subset(alldata,datetime>=ymd_hms("2007-02-01 00:00:00") &
                  datetime<ymd_hms("2007-02-03 00:00:00"))



#plot
png(filename="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,4,1,1))
plot(subdata$datetime,subdata$Global_active_power,type="l",
     ylab="Global Active Power",xlab="")
plot(subdata$datetime,subdata$Voltage,type="l",
     ylab="Voltage",xlab="datetime")
plot(subdata$datetime,subdata$Sub_metering_1,type="l",
     ylab="Energy sub metering",col="grey",xlab="")
lines(subdata$datetime,subdata$Sub_metering_2,col="red")
lines(subdata$datetime,subdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(1,1,1),col=c("grey","blue","red"))
plot(subdata$datetime,subdata$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime")
dev.off()
##plot3 script
#unzip file "household_power_comsumption.txt" to your working directory
#run below script

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
png(filename="plot3.png",width = 480, height = 480)
plot(subdata$datetime,subdata$Sub_metering_1,type="l",
            ylab="Energy sub metering",col="grey",xlab="")
lines(subdata$datetime,subdata$Sub_metering_2,col="red")
lines(subdata$datetime,subdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(1,1,1),col=c("grey","blue","red"),cex=0.9)
dev.off()
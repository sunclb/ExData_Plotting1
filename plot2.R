##plot2 script

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
png(filename="plot2.png",width = 480, height = 480)
plot(subdata$datetime,subdata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
data1<-read.csv("./household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE, 
                nrow=1)
a<-data1[1,1]
b<-data1[1,2]
c<-paste(a,b)
c<-strptime(c,format = "%d/%m/%Y %H:%M:%S")
d<-"2007-02-01 00:00:00"
e<-"2007-02-03 00:00:00"
d<-strptime(d,format = "%Y-%m-%d %H:%M:%S")
e<-strptime(e,format = "%Y-%m-%d %H:%M:%S")
c<-as.numeric(c)
d<-as.numeric(d)
e<-as.numeric(e)
n1<-(d-c)/60
n2<-(e-d)/60
data<-read.csv("./household_power_consumption.txt",sep = ";",na.strings = "?",header = FALSE, 
               nrow=n2,skip = n1+1)
colnames(data)<-colnames(data1)


a<-data[,1]
b<-data[,2]
DateTime<-paste(a,b)
DateTime<-strptime(DateTime,format = "%d/%m/%Y %H:%M:%S")
Weekdays<-weekdays(DateTime,abbreviate = TRUE)
data2<-cbind(data,DateTime,Weekdays)


png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

with(data2,plot(DateTime,Global_active_power,type = "l",xlab = "", 
                 ylab = "Global Active Power"))

with(data2,plot(DateTime,Voltage,type = "l",xlab = "datetime", 
                ylab = "Voltage"))

with(data2,plot(DateTime,Sub_metering_1,type = "l",col="black",xlab = "",
                ylab = "Energy sub metering"))
with(data2,points(DateTime,Sub_metering_2,type = "l",col="red"))
with(data2,points(DateTime,Sub_metering_3,type = "l",col="blue"))
legend("topright",lty = 1,col=c("black","red","blue"),bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))            

with(data2,plot(DateTime,Global_reactive_power,type = "l",xlab = "datetime", 
                ylab = "Global_reactive_Power"))        
        
dev.off()

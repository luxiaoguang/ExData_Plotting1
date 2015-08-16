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


png(file="plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",main = "Global Active Power")
dev.off()


##install.packages("sqldf")
require(sqldf)
file<-c("~/Exploratory/household_power_consumption.txt")
data<-read.csv.sql(file,sql="select * from file where 
                    (Date=='1/2/2007' OR Date=='2/2/2007')",sep=";")

data[["Date"]]<-
        strptime(paste(data[["Date"]],data[["Time"]]),format="%d/%m/%Y %X")

png(filename="plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(data[["Date"]],data[["Global_active_power"]],type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
plot(data[["Date"]],data[["Voltage"]],type="l",ylab="Voltage",xlab="datetime")
plot(data[["Date"]],data[["Sub_metering_1"]],type="l",
     ylab="Energy sub metering",xlab="")
lines(data[["Date"]],data[["Sub_metering_2"]],type="l",col="red")
lines(data[["Date"]],data[["Sub_metering_3"]],type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
plot(data[["Date"]],data[["Global_reactive_power"]],type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()



##install.packages("sqldf")
require(sqldf)
file<-c("~/Exploratory/household_power_consumption.txt")
data<-read.csv.sql(file,sql="select * from file where 
                    (Date=='1/2/2007' OR Date=='2/2/2007')",sep=";")

data[["Date"]]<-
        strptime(paste(data[["Date"]],data[["Time"]]),format="%d/%m/%Y %X")

png(filename="plot3.png",width=480,height=480,bg="transparent")
plot(data[["Date"]],data[["Sub_metering_1"]],type="l",
     ylab="Energy sub metering",xlab="")
lines(data[["Date"]],data[["Sub_metering_2"]],type="l",col="red")
lines(data[["Date"]],data[["Sub_metering_3"]],type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()

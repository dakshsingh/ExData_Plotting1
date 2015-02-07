
##install.packages("sqldf")
require(sqldf)
file<-c("~/Exploratory/household_power_consumption.txt")
data<-read.csv.sql(file,sql="select * from file where 
                    (Date=='1/2/2007' OR Date=='2/2/2007')",sep=";")

data[["Date"]]<-
        strptime(paste(data[["Date"]],data[["Time"]]),format="%d/%m/%Y %X")

png(filename="plot2.png",width=480,height=480,bg="transparent")
plot(data[["Date"]],data[["Global_active_power"]],type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

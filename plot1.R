
##install.packages("sqldf")
require(sqldf)
file<-c("~/Exploratory/household_power_consumption.txt")
data<-read.csv.sql(file,sql="select * from file where 
                    (Date=='1/2/2007' OR Date=='2/2/2007')",sep=";")

data[["Date"]]<-
        strptime(paste(data[["Date"]],data[["Time"]]),format="%d/%m/%Y %X")

png(filename="plot1.png",width=480,height=480,bg="transparent")
hist(data[["Global_active_power"]],col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()


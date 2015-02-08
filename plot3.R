plot3<-function() {

  ## loading lybreries
  
  install.packages("lubridate")
  library(lubridate)
  
  ## reading data

  data_subset<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  data<-data_subset[which(data_subset$Date=="1/2/2007"|data_subset$Date=="2/2/2007"),]
  data$Global_active_power<-as.numeric(as.character((data$Global_active_power)))
  data$Sub_metering_1<-as.numeric(as.character((data$Sub_metering_1)))
  data$Sub_metering_2<-as.numeric(as.character((data$Sub_metering_2)))
  data$Sub_metering_3<-as.numeric(as.character((data$Sub_metering_3)))
    
  ## Create time axis mergin Date and Time variables
  
  data$DateTime<-dmy_hms(paste(as.character(data$Date),as.character(data$Time)))
  
  ## plotting 

  png(filename="plot3.png",width=480,height=480)
  with(data,{
    plot(DateTime,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
    points(DateTime,Sub_metering_2,type="l",col="red")
    points(DateTime,Sub_metering_3,type="l",col="blue")
    legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  })  
  dev.off()
  
}
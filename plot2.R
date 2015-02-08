plot2<-function() {
  
  ## loading lybreries
  
  install.packages("lubridate")
  library(lubridate)

  ## reading data

  data_subset<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  data<-data_subset[which(data_subset$Date=="1/2/2007"|data_subset$Date=="2/2/2007"),]
  data$Global_active_power<-as.numeric(as.character((data$Global_active_power)))

  ## Create time axis mergin Date and Time variables
  
  data$DateTime<-dmy_hms(paste(as.character(data$Date),as.character(data$Time)))
  
  ## plotting  
 
  png(filename="plot2.png",width=480,height=480)
  plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
  
}
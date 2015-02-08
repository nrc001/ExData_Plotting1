plot1<-function() {

  ## reading data

  data_subset<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  data<-data_subset[which(data_subset$Date=="1/2/2007"|data_subset$Date=="2/2/2007"),]
  data$Global_active_power<-as.numeric(as.character((data$Global_active_power)))

  ## plotting histagram
  
  png(filename="plot1.png",width=480,height=480)
  hist(data$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
  
}
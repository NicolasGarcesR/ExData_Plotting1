data<- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
filter<- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


filter$Date<- as.Date(filter$Date, format="%d/%m/%Y")
filter$Time <- strptime(filter$Time, format="%H:%M:%S")
filter[1:1440,"Time"] <- format(filter[1:1440,"Time"],"2007-02-01 %H:%M:%S")
filter[1441:2880,"Time"] <- format(filter[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(filter$Time,as.numeric(as.character(filter$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

png("plot2.png", width=480, height=480)
dev.off()
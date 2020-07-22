data<- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
filter<- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")


hist(as.numeric(as.character(filter$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")
png("plot1.png", width=480, height=480)
dev.off()

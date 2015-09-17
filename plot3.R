###  Loading the dataset into R
if(!exists("hpcdata")){
  hpcdata <- read.csv("./household_power_consumption.txt", row.names = NULL, 
                      check.names=F, stringsAsFactors=F, header=T, sep=';', 
                      na.strings="?", comment.char="", quote='\"')
}  

## Subsetting the data
hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")
subdata <- subset(hpcdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting the dates and the times
hpcdatetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$HPCdatetime <- as.POSIXct(hpcdatetime)

## Creating the Plot 3
with(subdata, { 
     plot(Sub_metering_1~HPCdatetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~HPCdatetime,col='Red')
     lines(Sub_metering_3~HPCdatetime,col='Blue') 
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

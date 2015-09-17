##  Loading the dataset into R
if(!exists("hpcdata")){
  hpcdata <- read.csv("./household_power_consumption.txt", row.names = NULL, 
                      check.names=F, stringsAsFactors=F, header=T, sep=';', 
                      na.strings="?", comment.char="", quote='\"')
}  

## Subsetting the data
hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")
subdata <- subset(hpcdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Creating the Plot 1
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

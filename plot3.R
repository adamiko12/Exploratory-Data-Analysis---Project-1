##set working directory
setwd("D:/אדם/datasciencecoursera/datascience - Exploratory Data Analysis/project1")

##set directory for the project
if(!file.exists("./household_power_consumption")){dir.create("./household_power_consumption")}

##reading the file on the requested dates
File <- "./household_power_consumption/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##creating the plot
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gpower <- as.numeric(subdata$Global_active_power)
sub1 <- as.numeric(subdata$Sub_metering_1)
sub2 <- as.numeric(subdata$Sub_metering_2)
sub3 <- as.numeric(subdata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

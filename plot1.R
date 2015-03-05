##set working directory
setwd("D:/אדם/datasciencecoursera/datascience - Exploratory Data Analysis/project1")

##set directory for the zip file
if(!file.exists("./household_power_consumption")){dir.create("./household_power_consumption")}

##extract the zip file
unzip("exdata-data-household_power_consumption.zip",exdir="./household_power_consumption")

##reading the file on the requested dates
File <- "./household_power_consumption/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##creating the plot
png("plot1.png", width=480, height=480)
plot <- as.numeric(subdata$Global_active_power)
hist(plot, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

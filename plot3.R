## The "data.table" package is required to run this script. Script will run when saved in the same working directory as the "Electric power consumption" dataset
library(data.table)
fulldata <- fread("./household_power_consumption.txt")
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
select.data <- subset(fulldata, Date=="2007-02-01" | Date=="2007-02-02")
select.data[,date.time:=paste(as.character(Date),Time)]
formatted.time <- strptime(select.data$date.time, format="%Y-%m-%d %H:%M:%S")
plot(formatted.time, select.data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(select.data, lines(formatted.time, select.data$Sub_metering_1, col="black"))
with(select.data, lines(formatted.time, select.data$Sub_metering_2, col="red"))
with(select.data, lines(formatted.time, select.data$Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=names(select.data)[7:9])
png("plot3.png")
plot(formatted.time, select.data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(select.data, lines(formatted.time, select.data$Sub_metering_1, col="black"))
with(select.data, lines(formatted.time, select.data$Sub_metering_2, col="red"))
with(select.data, lines(formatted.time, select.data$Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=names(select.data)[7:9])
dev.off()
## The "data.table" package is required to run this script. Script will run when saved in the same working directory as the "Electric power consumption" dataset
library(data.table)
fulldata <- fread("./household_power_consumption.txt")
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
select.data <- subset(fulldata, Date=="2007-02-01" | Date=="2007-02-02")
select.data$Global_active_power <- as.numeric(select.data$Global_active_power)
hist(select.data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png, file="plot1.png")
dev.off()
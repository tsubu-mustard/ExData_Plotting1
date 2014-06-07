# set locale
# Sys.setlocale("LC_ALL", "en_US.UTF-8")

library(data.table)
pc <- fread("household_power_consumption.txt")

# replace ? with NA
pc[pc == "?"] <- NA
# change Date Col class from charcter to date
datetime <- paste(pc$Date, pc$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
pc <- data.frame(pc, datetime)
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")

# subset
subpc <- subset(pc, pc$Date >= as.Date("2007-02-01") & pc$Date <= as.Date("2007-02-02"))
# change format
subpc$Global_active_power <- as.numeric(subpc$Global_active_power)
subpc$Sub_metering_1 <- as.numeric(subpc$Sub_metering_1)
subpc$Sub_metering_2 <- as.numeric(subpc$Sub_metering_2)
subpc$Sub_metering_3 <- as.numeric(subpc$Sub_metering_3)

# plot
png(filename="plot3.png", width=480, height=480)
plot(x=subpc$datetime, y=subpc$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
points(x=subpc$datetime, y=subpc$Sub_metering_2, type="l", col="red")
points(x=subpc$datetime, y=subpc$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metring_1", "Sub_metring_2", "Sub_metring_3"), lty="solid", col=c("black", "red", "blue"))
# close device
dev.off()

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
# change Global_active_power Col class from character to numeric
subpc$Global_active_power <- as.numeric(subpc$Global_active_power)
# plot
png(filename="plot2.png", width=480, height=480)
plot(x=subpc$datetime, y=subpc$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")
# close device
dev.off()

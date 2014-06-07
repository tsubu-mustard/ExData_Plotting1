library(data.table)
pc <- fread("household_power_consumption.txt")

# replace ? with NA
pc[pc == "?"] <- NA
# change Date Col class from charcter to date
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")
# subset
subpc <- subset(pc, pc$Date >= as.Date("2007-02-01") & pc$Date <= as.Date("2007-02-02"))
# change Global_active_power Col class from character to numeric
subpc$Global_active_power <- as.numeric(subpc$Global_active_power)
# show histgram
png(filename="plot1.png", width=480, height=480)
hist(subpc$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# close device
dev.off()

# fill in data
dat <- read.table("household_power_consumption.txt", sep = ";", 
                  header = TRUE, 
                  colClasses = c('character', 'character', 'numeric',
                                 'numeric', 'numeric', 'numeric',
                                 'numeric', 'numeric', 'numeric'), 
                  na.strings='?')

# choose the interval
start_date <- "2007-02-1"
end_date <- "2007-02-2"

dat$DateTime <- strptime(paste(dat$Date, dat$Time), 
                         "%d/%m/%Y %H:%M:%S")
dat <- subset(dat, as.Date(DateTime) >= as.Date(start_date) & 
                   as.Date(DateTime) <= as.Date(end_date))

# open the PNG graphic device
png("plot3.png", height=480, width=480)

# draw empty plot 
plot(dat$DateTime,
     dat$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "", type="n")

# draw data
lines(dat$DateTime, dat$Sub_metering_1, col = "black")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")

# set the plot legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close PNG graphic device
dev.off()

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

# ppen PNG graphic device plot1.png
png("plot1.png", height=480, width=480)

# plot data
hist(dat$Global_active_power, col='red', 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# close PNG graphic device
dev.off()
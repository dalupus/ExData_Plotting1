
library(lubridate)

# read the data
d <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?",
               colClasses=c("character","character","numeric","numeric","numeric","numeric",
                            "numeric","numeric","numeric"))

# subset out the 2 days we are looking for
d <- subset(d,Date == "1/2/2007" | Date == "2/2/2007")

# convert the date/time strings to r date/times
d$Time <- dmy_hms(paste(d$Date, d$Time))
d$Date <- dmy(d$Date)

#create the plot
png("plot1.png")
hist(d$Global_active_power, #create a histogram
     col='red', #set the color
     main="Global Active Power", #set the title
     xlab='Global Active Power (kilowatts)') #set the x-axis label
dev.off()

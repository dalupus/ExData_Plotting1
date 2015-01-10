
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

png('plot3.png')

with(d, {
  plot(Time, Sub_metering_1,type="n", #create empty plot
       xlab="", #remove x-axis label
       ylab="Enerby sub metering") #set y axis label
  lines(Time, Sub_metering_1, col='black') #print first line
  lines(Time, Sub_metering_2, col='red') #print 2nd line
  lines(Time, Sub_metering_3, col= 'blue') #print 3rd line
  legend("topright",lty=1,col=c('black','red','blue'),  #add the legend
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  })
dev.off()
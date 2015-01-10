
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

png("plot4.png")
par(mfrow = c(2,2))  # make this a 2x2 set of plots
with(d,plot(Time,Global_active_power,type="l", #create the first plot
       xlab="", #remove the x-axis label
       ylab="Global Active Power")) #set the y axis label

with(d,plot(Time,Voltage,type='l', #create the second plot
       xlab="datetime", #set the x-axis label
       ylab="Voltage")) #set the y-axis label

with(d,{
  plot(Time, Sub_metering_1,type="n", #create the 3rd plot
       xlab="", #remove the x-axis label
       ylab="Enerby sub metering") #set the y-axis label
  lines(Time, Sub_metering_1, col='black') #add the 1st line
  lines(Time, Sub_metering_2, col='red') #add the 2nd line
  lines(Time, Sub_metering_3, col= 'blue') #add the 3rd line
  legend("topright",lty=1,col=c('black','red','blue'), bty='n', #add the legend removing the border
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  })

with(d, plot(Time, Global_reactive_power,type="l", #create the 4th plot
       xlab="datetime")) #set the x-axis label

dev.off()



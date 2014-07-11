.clc() # clear env
setwd("/Users/eyalsoreq/ExData_Plotting1")  # set working dir and load the requested date range 
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)) # Get header from same file 
dat$Time <- strptime(paste(dat$Date, ' ', dat$Time ), "%d/%m/%Y %H:%M:%S") # make time a date object

### plot 04 2X2 plot 
png(file = "plot04.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(dat$Time, dat$Global_active_power,type = "l",main = "",ylab = "Global active power (kilowatts)",xlab = "",xaxt = "n") 
  axis.POSIXct(side = 1, dat$Time, format = "%A")
plot(dat$Time, dat$Voltage,type = "l",main = "",ylab = "Voltage",xlab = "datetime",xaxt = "n")
  axis.POSIXct(side = 1, dat$Time, format = "%A")
plot(dat$Time, dat$Sub_metering_1,type = "l",col = "black",main = "",ylab = "Energy sub metering",xlab = "",xaxt = "n")
  ylim <- par("yaxp")[1:2]
  lines(dat$Time,dat$Sub_metering_2,col = "red",ylim=ylim)
  lines(dat$Time,dat$Sub_metering_3,col = "blue",ylim=ylim)
  axis.POSIXct(side = 1, dat$Time, format = "%A")
  legend("topright",names(dat[,7:9]),lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"), bty="n",cex=0.8) 
plot(dat$Time, dat$Global_reactive_power, type = "l",main = "",ylab = "Global_reactive_power",xlab = "datetime",xaxt = "n")
  axis.POSIXct(side = 1, dat$Time, format = "%A")
dev.off()
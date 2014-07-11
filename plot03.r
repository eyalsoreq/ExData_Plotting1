.clc() # clear env
setwd("/Users/eyalsoreq/ExData_Plotting1")  # set working dir and load the requested date range 
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)) # Get header from same file 
dat$Time <- strptime(paste(dat$Date, ' ', dat$Time ), "%d/%m/%Y %H:%M:%S") # make time a date object

### plot 03 three submetering as a function of time

png(file = "plot03.png",width = 480, height = 480, units = "px")
p<- with(dat, plot(dat$Time, dat$Sub_metering_1,
                   type = "l",col = "black",
                   main = "",ylab = "Energy sub metering",
                   xlab = "",xaxt = "n"))
ylim <- par("yaxp")[1:2]
p + lines(dat$Time,dat$Sub_metering_2,col = "red",ylim=ylim)+ lines(dat$Time,dat$Sub_metering_3,col = "blue",ylim=ylim)
axis.POSIXct(side = 1, dat$Time, format = "%A")
legend("topright", # places a legend at the appropriate place 
       names(dat[,7:9]), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),col=c("black","blue","red")) # gives the legend lines the correct color and width
dev.off()
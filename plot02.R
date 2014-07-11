.clc() # clear env
setwd("/Users/eyalsoreq/ExData_Plotting1")  # set working dir and load the requested date range 
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)) # Get header from same file 
dat$Time <- strptime(paste(dat$Date, ' ', dat$Time ), "%d/%m/%Y %H:%M:%S") # make time a date object

### plot 02 Global active power as a function of time
png(file = "plot02.png",width = 480, height = 480, units = "px")
with(dat, plot(dat$Time, dat$Global_active_power,
               type = "l",
               main = "Global active power",  ## Add a title
               ylab = "Global active power (kilowatts)",
               xlab = "",
               xaxt = "n"))
axis.POSIXct(side = 1, dat$Time, format = "%A")
dev.off()
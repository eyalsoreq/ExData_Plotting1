.clc <- function() {
  rm(list = ls(.GlobalEnv), envir = .GlobalEnv)
}
.clc() # clean function to clear env


# set working dir and load the requested date range 
setwd("/Users/eyalsoreq/ExData_Plotting1") 
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')

# Get header from same file 
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# make time a date object
dat$Time <- strptime(paste(dat$Date, ' ', dat$Time ), "%d/%m/%Y %H:%M:%S")

### plot 01 hist 
png(file = "plot01.png",width = 480, height = 480, units = "px")
with(dat, hist(dat$Global_active_power, 
     main = "Global active power",  ## Add a title
     xlab = "Global active power (kilowatts)",  ## Add xlabel
     col = "red"))  ## color bars red
dev.off()


library("data.table")

setwd("C:/Users/parth/OneDrive/Desktop/ExData_Plotting")

powerdata <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

powerdata[, GAP := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerdata[, DT := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerdata <- powerdata[(DT < "2007-02-03") & (DT >= "2007-02-01")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = powerdata[, DT]
     , y = powerdata[, GAP]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
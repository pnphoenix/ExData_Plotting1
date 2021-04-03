library("data.table")

setwd("C:/Users/parth/OneDrive/Desktop/ExData_Plotting")

powerdata <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

powerdata[, GAP := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

powerdata[, DT := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerdata <- powerdata[ (DT < "2007-02-03") & (DT >= "2007-02-01") ]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(powerdata[, DT], powerdata[, GAP], type="l", xlab="", ylab="Global Active Power")

plot(powerdata[, DT],powerdata[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(powerdata[, DT], powerdata[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerdata[, DT], powerdata[, Sub_metering_2], col="red")
lines(powerdata[, DT], powerdata[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(powerdata[, DT], powerdata[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
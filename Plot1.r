library("data.table")

setwd("C:/Users/parth/OneDrive/Desktop/ExData_Plotting")

powerdata <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


powerdata[, GAP := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


powerdata <- powerdata[(Date <= "2007-02-02") & (Date >= "2007-02-01")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(powerdata[, GAP], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


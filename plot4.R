## R-script to construct plot 4

## load dataset from file: Semicolon separated values, missing values are coded as "?" 
data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?") 

## convert Date column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## subset dataset: Only data from Feb 1, 2007 and Feb 2, 2007 is to be plotted 
data <- data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"), ]

## add additional column DateTime, containing exact time (Date and Time columns combined)
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## set graphical parameters for plots
par(mfrow = c(2, 2), cex.lab = .7, cex.axis = .7, mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

## create plots
with(data, {
    plot(DateTime, Global_active_power, type = "l", ylab = "Glaobal Active Power", xlab = "")
    plot(DateTime, Voltage, type = "l", xlab = "datetime")
    plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
      lines(DateTime, Sub_metering_1, col = "black")
      lines(DateTime, Sub_metering_2, col = "red")
      lines(DateTime, Sub_metering_3, col = "blue")
      legend("topright", lty = c(1, 1, 1), bty = "n",
        col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        y.intersp = .5, cex = .5)
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

## Copy plot to a PNG file
dev.copy(png, file = "../Github/ExData_Plotting1/plot4.png")  
dev.off()  
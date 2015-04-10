## R-script to construct plot 3

## load dataset from file: Semicolon separated values, missing values are coded as "?" 
data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?") 

## convert Date column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## subset dataset: Only data from Feb 1, 2007 and Feb 2, 2007 is to be plotted 
data <- data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"), ]

## add additional column DateTime, containing exact time (Date and Time columns combined)
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## create plot 3: create empty plot first, with axis labels and decreased font size, then add graphs and legend
with(data, {
    plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering",
        cex.axis = .8, cex.lab = .8)
    lines(DateTime, Sub_metering_1, col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
})
legend("topright", lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = .8, y.intersp = .5)

## Copy plot to a PNG file
dev.copy(png, file = "../Github/ExData_Plotting1/plot3.png", width = 480, height = 480)  
dev.off()  

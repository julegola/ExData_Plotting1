## R-script to construct plot 2

## load dataset from file: Semicolon separated values, missing values are coded as "?" 
data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?") 

## convert Date column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## subset dataset: Only data from Feb 1, 2007 and Feb 2, 2007 is to be plotted 
data <- data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"), ]

## add additional column DateTime, containing exact time (Date and Time columns combined)
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## create plot 2: line chart, set label for axis, decrease font size
with(data, plot(DateTime, Global_active_power, type = "l", 
                ylab = "Glaobal Active Power (kilowatts)", xlab = "",
                cex.lab = .8, cex.axis = .8))

## Copy plot to a PNG file
dev.copy(png, file = "../Github/ExData_Plotting1/plot2.png", width = 480, height = 480)  
dev.off()  

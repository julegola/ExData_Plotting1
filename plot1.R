## R-script to construct plot 1

## load dataset from file: Semicolon separated values, missing values are coded as "?" 
data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?") 

## convert Date column to Date format
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))  

## subset dataset: Only data from Feb 1, 2007 and Feb 2, 2007 is to be plotted 
data <- data[data$Date == as.Date("2007/02/01") | data$Date == as.Date("2007/02/02"), ]

## create histogram, set color, title, label for x-axis and decrease font size
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     cex.main = .9, cex.lab = .8, cex.axis = .8)

## Copy plot to a PNG file
dev.copy(png, file = "../Github/ExData_Plotting1/plot1.png", width = 480, height = 480)  
dev.off()  

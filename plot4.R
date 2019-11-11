## Creates 4 plots of Global Active Power, Voltage, Energy Sub Metering and Global Reactive Power against time (Plot 4)

## Import libraries
library(tidyverse)

## Read data into R
colnames <- read.table("./data/household_power_consumption.txt", sep = ";", nrows = 1)
electric <- as.tbl(read.table("./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = as_vector(colnames)))
rm(colnames)

## Convert Date and Time to single Date/Time variable 
electric <- electric %>% mutate(Date_Time = paste(electric$Date, electric$Time, sep = " ") %>% dmy_hms())

## Produce line plot and save as png file
png(file = "plot4.png")
par(mfrow = c(2,2))
with(electric, {
        plot(Date_Time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
        
        plot(Date_Time, Voltage, ylab = "Voltage", xlab = "", type = "l")
        
        plot(Date_Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col = "black")
        points(Date_Time, Sub_metering_2, type = "l", col = "red")
        points(Date_Time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub metering 1","Sub metering 2","Sub metering 3"), bty = "n")
        
        plot(Date_Time, Global_reactive_power, ylab = "Global Reactive Power", xlab = "", type = "l")

})
dev.off()   


#dev.off()
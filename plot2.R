## Creates plot of Global Active Power against time (Plot 2)

## Import libraries
library(tidyverse)

## Read data into R
colnames <- read.table("./data/household_power_consumption.txt", sep = ";", nrows = 1)
electric <- as.tbl(read.table("./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = as_vector(colnames)))
rm(colnames)

## Convert Date and Time to single Date/Time variable 
electric <- electric %>% mutate(Date_Time = paste(electric$Date, electric$Time, sep = " ") %>% dmy_hms())

## Produce line plot and save as png file
png(file = "plot2.png")
with(electric, plot(Date_Time,Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))
dev.off()
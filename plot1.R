## Creates histogram of Global Active Power (Plot 1)

## Import libraries
library(tidyverse)

## Read data into R
colnames <- read.table("./data/household_power_consumption.txt", sep = ";", nrows = 1)
electric <- as.tbl(read.table("./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, col.names = as_vector(colnames)))
rm(colnames)

## Convert Date and Time to single Date/Time variable 
electric <- electric %>% mutate(Date_Time = paste(electric$Date, electric$Time, sep = " ") %>% dmy_hms())

## Produce histogram and save as png file
png(file = "plot1.png")
with(electric, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
dev.off()


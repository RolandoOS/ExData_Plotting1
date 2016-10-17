#setwd('/Users/developer3/Desktop/JHU_DS_Cert/4_Exploratory_Data_Analysis/ExData_Plotting1-master')

library(dplyr)
library(lubridate)
rm(list = ls())

data  <- tbl_df(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)) %>%
    mutate(Date = dmy(Date)) %>%
    filter(Date == "2007-02-01" | Date == "2007-02-02") %>%
    mutate(DateTime = paste(Date,Time)) %>%
    mutate(DateTime = ymd_hms(DateTime)) %>%
    select(DateTime, Global_active_power:Sub_metering_3) %>%
    mutate_each(funs(as.numeric(as.character(.))), Global_active_power:Sub_metering_3)
    
png("plot1.png", width=480, height=480, units="px")

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
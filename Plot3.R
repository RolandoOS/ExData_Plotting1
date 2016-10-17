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

png("plot3.png", width=480, height=480, units="px")

with(data,  plot(DateTime, Sub_metering_1,type='l', ylab ="Energy sub metering", xlab=""))
with(data, lines(DateTime, Sub_metering_2,type='l', col='red'))
with(data, lines(DateTime, Sub_metering_3,type='l', col="blue"))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()
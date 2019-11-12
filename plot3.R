library(tidyverse)

x <- read.csv("~/Desktop/CodeClass/ExData_Plotting1/household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)

filt <- dplyr::filter(x, Date == "1/2/2007" | Date == "2/2/2007")

filt$t <- as.POSIXct(paste(filt$Date, filt$Time), format="%d/%m/%Y %H:%M:%S")
filt$Sub_metering_1 <- as.numeric(as.character(filt$Sub_metering_1))
filt$Sub_metering_2 <- as.numeric(as.character(filt$Sub_metering_2))

plot3 <- filt%>%
  ggplot()+
  aes(x =t)+
  geom_line(aes(y = filt$Sub_metering_1), col = "black")+
  geom_line(aes(y = filt$Sub_metering_2), col = "red")+
  geom_line(aes(y = filt$Sub_metering_3), col = "blue")+
  ylim(0,40)

ggsave("~/Desktop/CodeClass/ExData_Plotting1/plot3.png", plot = plot3,device = "png", units = "in", height = 4.8,width = 4.8,dpi = 100)


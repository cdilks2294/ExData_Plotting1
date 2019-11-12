library(tidyverse)
library(cowplot)
x <- read.csv("~/Desktop/CodeClass/ExData_Plotting1/household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)

filt <- dplyr::filter(x, Date == "1/2/2007" | Date == "2/2/2007")%>%
  dplyr::mutate(Global_active_power = as.numeric(as.character(Global_active_power)))

filt$t <- as.POSIXct(paste(filt$Date, filt$Time), format="%d/%m/%Y %H:%M:%S")

a <- filt %>%
  ggplot()+
  aes(x = t,y=Global_active_power)+
  geom_path()

filt$Sub_metering_1 <- as.numeric(as.character(filt$Sub_metering_1))
filt$Sub_metering_2 <- as.numeric(as.character(filt$Sub_metering_2))

b <- filt%>%
  ggplot()+
  aes(x =t)+
  geom_line(aes(y = filt$Sub_metering_1), col = "black")+
  geom_line(aes(y = filt$Sub_metering_2), col = "red")+
  geom_line(aes(y = filt$Sub_metering_3), col = "blue")+
  ylim(0,40)

c <- filt %>%
  ggplot()+
  aes(x =t, y=as.numeric(Voltage))+
  geom_line()


d <- filt %>%
  ggplot()+
  aes(x =t, y=as.numeric(Global_reactive_power))+
  geom_line()

plot4 <- plot_grid(a,b,c,d,nrow = 2,ncol = 2)

ggsave("~/Desktop/CodeClass/ExData_Plotting1/plot4.png", plot = plot4,device = "png", units = "in", height = 4.8,width = 4.8,dpi = 100)


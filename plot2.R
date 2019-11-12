library(tidyverse)

x <- read.csv("~/Desktop/CodeClass/ExData_Plotting1/household_power_consumption.txt", sep = ";")

filt <- dplyr::filter(x, Date == "1/2/2007" | Date == "2/2/2007")%>%
  dplyr::mutate(Global_active_power = as.numeric(as.character(Global_active_power)))

filt$t <- as.POSIXct(paste(filt$Date, filt$Time), format="%d/%m/%Y %H:%M:%S")


plot2<-filt %>%
  ggplot()+
  aes(x = t,y=Global_active_power)+
  geom_path()
ggsave("~/Desktop/CodeClass/ExData_Plotting1/plot2.png", plot = plot2,device = "png", units = "in", height = 4.8,width = 4.8,dpi = 100)

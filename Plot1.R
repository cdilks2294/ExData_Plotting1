library(tidyverse)
x <- read.csv("~/Desktop/CodeClass/ExData_Plotting1/household_power_consumption.txt", sep = ";")

filt <- dplyr::filter(x, Date == "1/2/2007" | Date == "2/2/2007")%>%
  dplyr::mutate(Global_active_power = as.numeric(as.character(Global_active_power)))

plot1 <- filt %>%
  ggplot()+
  aes(x =Global_active_power)+
  geom_histogram(fill = "red", color = "black")

ggsave("~/Desktop/CodeClass/ExData_Plotting1/plot1.png", plot = plot1,device = "png", units = "in", height = 4.8,width = 4.8,dpi = 100)

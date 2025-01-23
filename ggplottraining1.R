#Data handling ggplot1

#Install necessary libraries
install.packages("tidyverse")
install.packages("ggplot2")

# Load the necessary libraries
library(tidyverse)
library(ggplot2)

#Import the data and convert it to tbl 
gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv") 
gapminder <- as_tibble(gapminder)

ggplot(data=gapminder, aes( x = year, y = lifeExp, group=country))+
  geom_point(aes(color=continent))+
  geom_line(color="blue")
  
Europe <- gapminder[gapminder$continent == "Europe",]
p1 <- ggplot(data = Europe, mapping = aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point(alpha=0.5, shape=13, size=0.5)+
  scale_x_log10()+
  geom_smooth(method="lm")+
  labs(
    title = ("Europe"),
    x=(" GDP per capita"),
    y=("Life Expectancy")
  )+
  facet_wrap(~country)+
  scale_y_continuous(breaks = seq(min(30), max(100), by = 20))+
  theme(axis.text.x = element_text(angle=45,hjust=1),
        axis.text.y = element_text(hjust=1, margin = margin(r=8)))

ggsave(filname="Americas_example", plot =p1)


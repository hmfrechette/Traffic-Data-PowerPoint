traffic_data <- read.csv("NH traffic stop.csv")

library(Hmisc)
library(dplyr)
library(stringr)
library(ggplot2)
library(lubridate)

tbl_df(traffic_data)

my_data<- select(traffic_data, stop_date, violation, stop_outcome)

#create new column for containing just the year

my_data$year_nh <- year(ymd(my_data$stop_date))

year_2014 <- my_data %>%
  filter(year_nh ==2014)

year_2015 <- my_data %>%
  filter(year_nh == 2015)

#create new columns containg the months

my_data$month_nh <- month(my_data$stop_date)

jan_2014 <- my_data %>%
  filter(month_nh == 1)%>% 
  filter(year_nh == 2014)

feb_2014 <- my_data %>%
  filter(month_nh == 2)%>%
  filter(year_nh == 2014)

mar_2014 <- my_data %>%
  filter(month_nh == 3) %>%
  filter(year_nh == 2014)

apr_2014 <- my_data %>%
  filter(month_nh == 4) %>%
  filter(year_nh == 2014)

may_2014 <- my_data %>%
  filter(month_nh == 5)%>%
  filter(year_nh == 2014)

jun_2014 <- my_data %>%
  filter(month_nh == 6) %>%
  filter(year_nh == 2014)

jul_2014 <- my_data %>%
  filter(month_nh == 7) %>%
  filter(year_nh == 2014)

aug_2014 <- my_data %>%
  filter(month_nh == 8) %>%
  filter(year_nh == 2014)

sep_2014 <- my_data %>%
  filter(month_nh == 9) %>%
  filter(year_nh == 2014)

oct_2014 <- my_data %>% 
  filter(month_nh == 10) %>%
  filter(year_nh == 2014)

nov_2014 <- my_data %>%
  filter(month_nh == 11)%>%
  filter(year_nh == 2014)

dec_2014 <- my_data %>%
  filter(month_nh == 12) %>%
  filter(year_nh == 2014)

#2015 months

jan_2015 <- my_data %>%
  filter(month_nh == 1)%>%
  filter(year_nh == 2015)
  

feb_2015 <- my_data %>%
  filter(month_nh == 2)%>%
  filter(year_nh == 2015)

mar_2015 <- my_data %>%
  filter(month_nh == 3)%>%
  filter(year_nh == 2015)

apr_2015 <- my_data %>%
  filter(month_nh == 4)%>%
  filter(year_nh == 2015)

may_2015 <- my_data %>%
  filter(month_nh == 5)%>%
  filter(year_nh == 2015)

jun_2015 <- my_data %>%
  filter(month_nh == 6)%>%
  filter(year_nh == 2015)

jul_2015 = my_data %>%
  filter(month_nh == 7)%>%
  filter(year_nh == 2015)

aug_2015 <- my_data %>%
  filter(month_nh == 8)%>%
  filter(year_nh == 2015)

sep_2015 <- my_data %>%
  filter(month_nh == 9)%>%
  filter(year_nh == 2015)

oct_2015 <- my_data %>%
  filter(month_nh == 10)%>%
  filter(year_nh == 2015)

nov_2015 <- my_data %>%
  filter(month_nh == 11)%>%
  filter(year_nh == 2015)

dec_2015 <- my_data %>%
  filter(month_nh == 12)%>%
  filter(year_nh == 2015)

# Number of violations in each month for 2014

jan14_stops <- nrow(jan_2014)
feb14_stops <- nrow(feb_2014)
mar14_stops <- nrow(mar_2014)
apr14_stops <- nrow(apr_2014)
may14_stops <- nrow(may_2014)
jun14_stops <- nrow(jun_2014)
jul14_stops <- nrow(jul_2014)
aug14_stops <- nrow(aug_2014)
sep14_stops <- nrow(sep_2014)
oct14_stops <- nrow(oct_2014)
nov14_stops <- nrow(nov_2014)
dec14_stops <- nrow(dec_2014)

# number of violation in each month for 2015

jan15_stops <- nrow(jan_2015)
feb15_stops <- nrow(feb_2015)
mar15_stops <- nrow(mar_2015)
apr15_stops <- nrow(apr_2015)
may15_stops <- nrow(may_2015)
jun15_stops <- nrow(jun_2015)
jul15_stops <- nrow(jul_2015)
aug15_stops <- nrow(aug_2015)
sep15_stops <- nrow(sep_2015)
oct15_stops <- nrow(oct_2015)
nov15_stops <- nrow(nov_2015)
dec15_stops <- nrow(dec_2015)

# graph # of violations for each month in each year
my_data$month_nh <- as.factor(my_data$month_nh)
my_data$year_nh <- as.factor(my_data$year_nh)

graph <- ggplot(my_data, aes(x= month_nh,  fill=year_nh)) + geom_bar(position = "dodge")
graph <- graph + xlab("Month") + ylab("# of stops")
graph <- graph + ggtitle("Stops per month in 2014 & 2015")
graph <- graph + scale_fill_discrete(name = "Year")
graph <- graph + theme_bw()
graph

library(plotly)
ggplotly(graph)

write.csv(traffic_data, "new traffic stop data code.csv")

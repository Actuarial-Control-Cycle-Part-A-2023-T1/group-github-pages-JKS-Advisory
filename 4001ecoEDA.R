library(tidyverse)
library(lubridate)
library(zoo)
library(dplyr)
library(ggplot2)
#set working directory
setwd('Downloads/')
data<-read.csv('4001ecodata.csv')
data<-as.data.frame(data)
# check for NA
sum(is.na(data)) # missing overnight lending rate 1897, NA for 1 yr risk free rate 2018
# inflation -990% in 2003
data<-data[-c(26,42,57),]
# time series 
p<-plot(data$Year, data$Inflation, type='l', col=1)
lines(data$Year, data$X1.yr.risk.free.rate, type='l', col=2) 
lines(data$Year, data$Government.Overnight.Bank.Lending.Rate, type='l', col=3)
lines(data$Year, data$X10.yr.risk.free.rate, type='l', col=4)
legend('topright', c('inflation','1 yr risk free rate', 'Overnight bank L.R','10 yr risk free rate'), lty=1, col=1:4)
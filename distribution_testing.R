install.packages('fitdistrplus')
library('fitdistrplus')
library('dplyr')
library('tidyverse')
library("EnvStats")

final_data <- read.csv("final_mapped_dataset_w_other.csv")
final_data
population_growth <- read.csv("population_growth.csv")
population_growth <- population_growth[c(1,4)]
population_growth

final_data <- left_join(final_data, population_growth, 'Year')
final_data$Inflated.Damage.Final <- final_data$Inflated.Damage * final_data$Cumulative

hazard_year <- final_data %>%
  group_by(Group, Year) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

hazard_year_no_inflation <- final_data %>%
  group_by(Group, Year) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Property.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

final_data$Size[final_data$Inflated.Damage.Final < 500000] <- "Minor"
final_data$Size[final_data$Inflated.Damage.Final >= 500000 & final_data$Inflated.Damage.Final < 5000000] <- "Medium"
final_data$Size[final_data$Inflated.Damage.Final >= 5000000 & final_data$Inflated.Damage.Final < 100000000] <- "Major"
final_data$Size[final_data$Inflated.Damage.Final >= 100000000] <- "Catastrophic"

final_data2 <- subset(final_data, !(final_data$Size %in% c("Catastrophic")))
plot(final_data2$Year, final_data2$Inflated.Damage.Final)

Catastrophic <- subset(final_data, (final_data$Size %in% c("Catastrophic")))
plot(Catastrophic$Inflated.Damage.Final)

plot(final_data$Inflated.Damage.Final)

hazard_year <- final_data2 %>%
  group_by(Year, Group, Size) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

freq_data <- hazard_year %>%
  group_by(freq) %>%
  tally()

chisq.test(freq_data$n)
barplot(poisson_data$n)

plot(fitdist(poisson_data$n,"pois"))
plot(fitdist(poisson_data$n,"nbinom"))

#test against normal

normal_test <- final_data %>%
  group_by(Year) %>%
  summarise(freq = sum(no.events),
            total_cost = sum(Inflated.Damage.Final),
            avg_cost = mean(Inflated.Damage.Final),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 


eqnorm(normal_test$total_cost, 0.9)
median(normal_test$total_cost)


cat_normal_test <- Catastrophic %>%
  group_by(Year) %>%
  summarise(freq = sum(no.events),
            total_cost = sum(Inflated.Damage.Final),
            avg_cost = mean(Inflated.Damage.Final),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 


eqnorm(cat_normal_test$total_cost, 0.9)


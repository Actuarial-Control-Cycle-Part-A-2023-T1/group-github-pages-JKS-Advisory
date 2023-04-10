library(ggplot2)

final_data <- read.csv("final_mapped_dataset_w_other.csv")
final_data
population_growth <- read.csv("population_growth.csv")
population_growth <- population_growth[c(1,4)]
population_growth

final_data <- left_join(final_data, population_growth, 'Year')
final_data$Inflated.Damage.Final <- final_data$Inflated.Damage * final_data$Cumulative
  
# Line chart - Frequency of events timeline - line for each peril

################################################################################
#################### Create data set with total peril info #####################
################################################################################
peril_total <- final_data %>%
  group_by(Group) %>%
  summarise(freq = sum(no.events),
            total_cost = sum(Inflated.Damage),
            total_deaths = sum(Fatalities),
            total_injuries = sum(Injuries)) 

# Bar chart - total deaths (split by peril) i.e. y axis = deaths, x-axis = peril
ggplot(peril_total, aes(fill=Group, x=Group, y=total_deaths)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Total Deaths') + xlab('Peril') +
  labs(title= "Total Deaths by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Bar chart - total injuries (split by peril)
ggplot(peril_total, aes(fill=Group, x=Group, y=total_injuries)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Total Injuries') + xlab('Peril') +
  labs(title= "Total Injuries by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Bar chart - total damage (split by peril)
ggplot(peril_total, aes(fill=Group, x=Group, y=total_cost)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Total Cost') + xlab('Peril') +
  labs(title= "Total Cost by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

################################################################################
#################### Create data set with average peril info ###################
################################################################################
peril_average <- final_data %>%
  group_by(Group) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

# Bar chart - average deaths (split by peril) i.e. y axis = deaths, x-axis = peril
ggplot(peril_average, aes(fill=Group, x=Group, y=avg_deaths)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Deaths') + xlab('Peril') +
  labs(title= "Average Deaths by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Bar chart - average injuries (split by peril)
ggplot(peril_average, aes(fill=Group, x=Group, y=avg_injuries)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Injuries') + xlab('Peril') +
  labs(title= "Average Injuries by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Bar chart - average damage (split by peril)
ggplot(peril_average, aes(fill=Group, x=Group, y=avg_cost)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Cost') + xlab('Peril') +
  labs(title= "Average Cost by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Bar chart - freq (split by peril)
ggplot(peril_average, aes(fill=Group, x=Group, y=freq)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Number of Events') + xlab('Peril') +
  labs(title= "Event Frequency by Peril") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Line chart - Average cost per peril

# Seasonality - Frequency


################################################################################
################### Create data set with average region info ###################
################################################################################
region_average <- final_data %>%
  group_by(Region) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

# Bar chart - frequency (split by region)
ggplot(region_average, aes(fill=Region, x=Region, y=freq)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Freq') + xlab('Region') +
  labs(title= "Average Freq by Region") 

# Bar chart - average deaths (split by region)
ggplot(region_average, aes(fill=Region, x=Region, y=avg_deaths)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Deaths') + xlab('Region') +
  labs(title= "Average Deaths by Region") 

# Bar chart - average injuries (split by region)
ggplot(region_average, aes(fill=Region, x=Region, y=avg_injuries)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Injuries') + xlab('Region') +
  labs(title= "Average Injuries by Region") 

# Bar chart - average cost (split by region)
ggplot(region_average, aes(fill=Region, x=Region, y=avg_cost)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Cost') + xlab('Region') +
  labs(title= "Average Cost by Region") 


################################################################################
############## Create data set with average peril and region info ##############
################################################################################
region_peril_average <- final_data %>%
  group_by(Region, Group) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

# Bar chart - average cost (split by region)
ggplot(region_peril_average, aes(fill=as.character(Region), x=Group, y=avg_cost)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Cost') + xlab('Peril') +
  labs(title= "Average Cost by Peril and Region") + 
  scale_fill_manual(values=c("#002060", "#00359E", "#1B5FE5", "#4D81E6", "#779FEB", "#A4BFF3"), name = "Region")

# Bar chart - average deaths (split by region)
ggplot(region_peril_average, aes(fill=as.character(Region), x=Group, y=avg_deaths)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Deaths') + xlab('Peril') +
  labs(title= "Average Deaths by Peril and Region") + 
  scale_fill_manual(values=c("#002060", "#00359E", "#1B5FE5", "#4D81E6", "#779FEB", "#A4BFF3"), name = "Region")

# Bar chart - average injuries (split by region)
ggplot(region_peril_average, aes(fill=as.character(Region), x=Group, y=avg_injuries)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Average Injuries') + xlab('Peril') +
  labs(title= "Average Injuries by Peril and Region") + 
  scale_fill_manual(values=c("#002060", "#00359E", "#1B5FE5", "#4D81E6", "#779FEB", "#A4BFF3"), name = "Region")



#frequency of events by region
ggplot(region_peril_average, aes(fill=Group, x=Region, y=freq)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Frequency') + xlab('Peril') +
  labs(title= "Average Frequency by Peril and Region") 
  

#Cost of events by region
ggplot(region_peril_average, aes(fill=Group, x=Region, y=avg_cost)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Cost') + xlab('Peril') +
  labs(title= "Average Cost by Peril and Region") 

#Deaths of events by region
ggplot(region_peril_average, aes(fill=Group, x=Region, y=avg_deaths)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Deaths') + xlab('Peril') +
  labs(title= "Average Deaths by Peril and Region") 

#Injuries of events by region
ggplot(region_peril_average, aes(fill=Group, x=Region, y=avg_injuries)) + 
  geom_bar(position="dodge", stat = "identity") +
  ylab('Injuries') + xlab('Peril') +
  labs(title= "Average Injuries by Peril and Region") 








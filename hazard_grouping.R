library("dplyr")
library("tidyr")
library("cluster")
library("data.table")



data <- read.csv("hazard_event_data.csv")
data["Hazard.Event"][data["Hazard.Event"] == "Severe Storm/Thunder Storm - Wind"] <- "Severe Storm/Thunder Storm/ Wind"

data$Region <- as.factor(data$Region)
data$Hazard.Event <- as.factor(data$Hazard.Event)
data$Quarter <- as.factor(data$Quarter)
data$no.events <- 1
summary(data)

# Country
# Frequency of each event

grouping_analysis_hazard <- data %>%
  group_by(Hazard.Event) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Property.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

grouping_analysis_region <- data %>%
  group_by(Region) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Property.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

cols <- c("Hazard.Event","Region")
grouping_analysis_hazard_region <- data %>% 
  group_by(across(all_of(cols))) %>% 
  summarise(freq = sum(no.events),
            avg_cost = mean(Property.Damage),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

grouping_cluster <- grouping_analysis_hazard[-2]
grouping_cluster$Hazard.Event <- as.character(grouping_cluster$Hazard.Event)
final_grouping <- grouping_analysis_hazard
final_grouping$Group <- final_grouping$Hazard.Event

for (i in 1:nrow(grouping_cluster)) {
  
  string <- as.character(grouping_cluster$Hazard.Event[i])
  string_list <- as.list(strsplit(string, "/ ")[[1]])
  string_list <- append(string_list, string)
  string_list <- string_list[!duplicated(string_list)]
  string_list
  
  if(length(string_list) > 1) {
    
    df_new <- grouping_cluster[grouping_cluster$Hazard.Event %in% string_list,]
    df_new$avg_cost <- log(df_new$avg_cost)
    df_new2 <- df_new[,-1]
    d_dist <- as.matrix(dist(df_new2))[,2]
    df_new3 <- cbind(df_new, d_dist)
    df_new4 <- df_new3[-2, ]
    final_grouping$Group[i] <- df_new4[which.min(df_new4$d_dist), 1]
    
  }
  
}

final_grouping$Group <- as.factor(final_grouping$Group)
peril_mapping <- final_grouping[c(1,6)]


#EXPORT DATASET WITH MAPPING
final_mapped_dataset <- left_join(data, peril_mapping, by = "Hazard.Event")
final_mapped_dataset$Group <- as.character(final_mapped_dataset$Group)
final_mapped_dataset$Group[final_mapped_dataset$Group %in% 
                             c("Coastal", 
                               "Fog", 
                               "Heat", 
                               "Landslide", 
                               "Wildfire")] <- "Other"
final_mapped_dataset$Group <- as.factor(final_mapped_dataset$Group)
sum(is.na(final_mapped_dataset$Group))

write.csv(final_mapped_dataset, "final_mapped_dataset.csv")
summary(final_mapped_dataset$Group)







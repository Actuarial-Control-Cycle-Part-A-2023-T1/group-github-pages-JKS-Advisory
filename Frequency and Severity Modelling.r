install.packages("EnvStats")
library("EnvStats")
library("tidyverse")

final_data <- read.csv("final_mapped_dataset.csv")
population_growth <- read.csv("population_growth.csv")
population_growth <- population_growth[c(1,4)]
population_growth

final_data <- left_join(final_data, population_growth, 'Year')
final_data$Inflated.Damage.Final <- final_data$Inflated.Damage * final_data$Cumulative

# breaking into major minor medium
final_data_cat <- final_data %>%
  mutate (Minor = ifelse(Inflated.Damage.Final < 500000,1,0 )) %>%
  mutate (Medium = ifelse(Inflated.Damage.Final < 5000000 & Inflated.Damage.Final >= 500000, 1, 0)) %>%
  mutate (Major = ifelse(Inflated.Damage.Final >= 5000000 & Inflated.Damage.Final < 50000000, 1, 0))

# export inflated damages
write.csv(final_data_cat, "fully_inflated_data.csv")

final_data_rmout <- final_data_cat %>% 
  filter(Inflated.Damage.Final < 50000000)

# average minor severity
severityminor <- final_data_rmout %>%
  filter(Minor == 1) %>%
  group_by(Group, Region) %>%
  summarise(MinorSev = quantile(Inflated.Damage.Final, 0.8))

#average medium severity 
severitymed <- final_data_rmout %>%
  filter(Medium == 1) %>%
  group_by(Group, Region) %>%
  summarise(MediumSev = quantile(Inflated.Damage.Final, 0.8))

#average major severity
severitymajor <- final_data_rmout %>%
  filter(Major == 1) %>%
  group_by(Group,Region) %>%
  summarise(MajorSev = quantile(Inflated.Damage.Final, 0.8))

## splits by region and peril
splitsbyregion2 <- final_data_rmout %>%
  group_by(Group, Region) %>%
  summarise(MinorCountRegion = sum(Minor),
            MediumCountRegion = sum(Medium),
            MajorCountRegion = sum(Major))

splitsbyperil2 <- final_data_rmout %>%
  group_by(Group) %>%
  summarise(MinorCountPeril= sum(Minor),
            MediumCountPeril = sum(Medium),
            MajorCountPeril = sum(Major))

splitsjoined2 <- left_join(splitsbyregion2, splitsbyperil2, by = c('Group'))

percentages2 <- splitsjoined2 %>%
  mutate(Minorpct = MinorCountRegion/MinorCountPeril, 
         Mediumpct = MediumCountRegion/MediumCountPeril, 
         Majorpct = MajorCountRegion/MajorCountPeril) %>%
  replace(is.na(.), 0)

# create empty dataset for frequency numbers
modelledfreq <- final_data_rmout %>%
  group_by(Group) %>%
  summarise(MinorEvents = 0, MediumEvents = 0, MajorEvents = 0)


# Setting up datasets for frequency nbinomial
yearlist <- final_data %>%
  group_by(Year) %>%
  summarise(col = 0)

yearlist2 <- yearlist[,-2]

hazard_year_minor <- final_data_rmout %>%
  filter(Minor == 1) %>%
  group_by(Group, Year) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage.Final),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

hazard_year_medium <- final_data_rmout %>%
  filter(Medium == 1) %>%
  group_by(Group, Year) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage.Final),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

hazard_year_major <- final_data_rmout %>%
  filter(Major == 1) %>%
  group_by(Group, Year) %>%
  summarise(freq = sum(no.events),
            avg_cost = mean(Inflated.Damage.Final),
            avg_deaths = mean(Fatalities),
            avg_injuries = mean(Injuries)) 

# Wind
Minor_Windf <- hazard_year_minor[hazard_year_minor$Group == 'Wind',]
Minor_Wind <- merge(Minor_Windf, yearlist2, "Year", all = TRUE)
Minor_Wind$freq[is.na(Minor_Wind$freq)] <- 0
nbminor_wind <- fitdist(Minor_Wind$freq, "nbinom")
qminor_wind <- quantile(nbminor_wind, 0.80)

Medium_Windf <- hazard_year_medium[hazard_year_medium$Group == 'Wind',]
Medium_Wind <- merge(Medium_Windf, yearlist2, "Year", all = TRUE)
Medium_Wind$freq[is.na(Medium_Wind$freq)] <- 0
nbmed_wind <- fitdist(Medium_Wind$freq, "nbinom")
qmed_wind <- quantile(nbmed_wind, 0.8)

Major_Windf <- hazard_year_major[hazard_year_major$Group == 'Wind',]
Major_Wind <- merge(Major_Windf, yearlist2, "Year", all = TRUE)
Major_Wind$freq[is.na(Major_Wind$freq)] <- 0
nbmaj_wind <- fitdist(Major_Wind$freq, "nbinom")
qmaj_wind <- quantile(nbmaj_wind, 0.8)

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Wind") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_wind$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_wind$quantiles)
    modelledfreq$MajorEvents[x] = as.numeric(qmaj_wind$quantiles)
  } 
}

# Drought
Minor_Droughtf <- hazard_year_minor[hazard_year_minor$Group == 'Drought',]
Minor_Drought <- merge(Minor_Droughtf, yearlist2, "Year", all = TRUE)
Minor_Drought$freq[is.na(Minor_Drought$freq)] <- 0
nbminor_drought <- fitdist(Minor_Drought$freq, "nbinom")
qminor_drought <- quantile(nbminor_drought, 0.80)
minordrought = 0.5

Medium_Droughtf <- hazard_year_medium[hazard_year_medium$Group == 'Drought',]
Medium_Drought <- merge(Medium_Droughtf, yearlist2, "Year", all = TRUE)
Medium_Drought$freq[is.na(Medium_Drought$freq)] <- 0
#eqmedium_drought <- eqnbinom(Medium_Drought$freq, p = 0.9)
mediumdrought = 0.5

Major_Droughtf <- hazard_year_major[hazard_year_major$Group == 'Drought',]
Major_Drought <- merge(Major_Droughtf, yearlist2, "Year", all = TRUE)
Major_Drought$freq[is.na(Major_Drought$freq)] <- 0
nbmaj_Drought <- fitdist(Major_Drought$freq, "nbinom")
qmaj_Drought <- quantile(nbmaj_Drought, 0.8)
#eqmajor_drought <- eqnbinom(Major_Drought$freq, p = 0.9)
majordrought = 0.5

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Drought") {
    modelledfreq$MinorEvents[x] = minordrought
    modelledfreq$MediumEvents[x] = mediumdrought
    modelledfreq$MajorEvents[x] = majordrought
  } 
}

# Flooding 
Minor_Floodf <- hazard_year_minor[hazard_year_minor$Group == 'Flooding',]
Minor_Flood <- merge(Minor_Floodf, yearlist2, "Year", all = TRUE)
Minor_Flood$freq[is.na(Minor_Flood$freq)] <- 0
nbminor_Flood <- fitdist(Minor_Flood$freq, "nbinom")
qminor_Flood <- quantile(nbminor_Flood, 0.80)

Medium_Floodf <- hazard_year_medium[hazard_year_medium$Group == 'Flooding',]
Medium_Flood <- merge(Medium_Floodf, yearlist2, "Year", all = TRUE)
Medium_Flood$freq[is.na(Medium_Flood$freq)] <- 0
nbmed_Flood <- fitdist(Medium_Flood$freq, "nbinom")
qmed_Flood <- quantile(nbmed_Flood, 0.8)

Major_Floodf <- hazard_year_major[hazard_year_major$Group == 'Flooding',]
Major_Flood <- merge(Major_Floodf, yearlist2, "Year", all = TRUE)
Major_Flood$freq[is.na(Major_Flood$freq)] <- 0
nbmaj_Flood <- fitdist(Major_Flood$freq, "nbinom")
qmaj_Flood <- quantile(nbmaj_Flood, 0.8)

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Flooding") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_Flood$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_Flood$quantiles)
    modelledfreq$MajorEvents[x] = as.numeric(qmaj_Flood$quantiles)
  } 
}

# Hail 
Minor_Hailf <- hazard_year_minor[hazard_year_minor$Group == 'Hail',]
Minor_Hail <- merge(Minor_Hailf, yearlist2, "Year", all = TRUE)
Minor_Hail$freq[is.na(Minor_Hail$freq)] <- 0
nbminor_Hail <- fitdist(Minor_Hail$freq, "nbinom")
qminor_Hail <- quantile(nbminor_Hail, 0.80)

Medium_Hailf <- hazard_year_medium[hazard_year_medium$Group == 'Hail',]
Medium_Hail <- merge(Medium_Hailf, yearlist2, "Year", all = TRUE)
Medium_Hail$freq[is.na(Medium_Hail$freq)] <- 0
nbmed_Hail <- fitdist(Medium_Hail$freq, "nbinom")
qmed_Hail <- quantile(nbmed_Hail, 0.8)

Major_Hail <- hazard_year_major[hazard_year_major$Group == 'Hail',]
#eqmajor_Hail <- eqnbinom(Major_Hail$freq, p = 0.9)
majorhail = 0.5

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Hail") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_Hail$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_Hail$quantiles)
    modelledfreq$MajorEvents[x] = majorhail
  } 
}

# Hurricane/Tropical Storm
Minor_Hurrf <- hazard_year_minor[hazard_year_minor$Group == 'Hurricane/Tropical Storm',]
Minor_Hurr <- merge(Minor_Hurrf, yearlist2, "Year", all = TRUE)
Minor_Hurr$freq[is.na(Minor_Hurr$freq)] <- 0
nbminor_Hurr <- fitdist(Minor_Hurr$freq, "nbinom")
qminor_Hurr <- quantile(nbminor_Hurr, 0.80)
minorhurr <- 0.5

Medium_Hurrf <- hazard_year_medium[hazard_year_medium$Group == 'Hurricane/Tropical Storm',]
Medium_Hurr <- merge(Medium_Hurrf, yearlist2, "Year", all = TRUE)
Medium_Hurr$freq[is.na(Medium_Hurr$freq)] <- 0
nbmed_Hurr <- fitdist(Medium_Hurr$freq, "nbinom")
qmed_Hurr <- quantile(nbmed_Hurr, 0.8)
medhurr <- 0.5

Major_Hurrf <- hazard_year_major[hazard_year_major$Group == 'Hurricane/Tropical Storm',]
Major_Hurr <- merge(Major_Hurrf, yearlist2, "Year", all = TRUE)
Major_Hurr$freq[is.na(Major_Hurr$freq)] <- 0
nbmaj_Hurr <- fitdist(Major_Hurr$freq, "nbinom")
qmaj_Hurr <- quantile(nbmaj_Hurr, 0.8)
majhurr <- 0.5

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Hurricane/Tropical Storm") {
    modelledfreq$MinorEvents[x] = minorhurr
    modelledfreq$MediumEvents[x] = medhurr
    modelledfreq$MajorEvents[x] = majhurr
  } 
}

# Lightning 
Minor_Lightningf <- hazard_year_minor[hazard_year_minor$Group == 'Lightning',]
Minor_Lightning <- merge(Minor_Lightningf, yearlist2, "Year", all = TRUE)
Minor_Lightning$freq[is.na(Minor_Lightning$freq)] <- 0
nbminor_Lightning <- fitdist(Minor_Lightning$freq, "nbinom")
qminor_Lightning <- quantile(nbminor_Lightning, 0.80)

Medium_Lightningf <- hazard_year_medium[hazard_year_medium$Group == 'Lightning',]
Medium_Lightning <- merge(Medium_Lightningf, yearlist2, "Year", all = TRUE)
Medium_Lightning$freq[is.na(Medium_Lightning$freq)] <- 0
nbmed_Lightning <- fitdist(Medium_Lightning$freq, "nbinom")
qmed_Lightning <- quantile(nbmed_Lightning, 0.8)

Major_Lightningf <- hazard_year_major[hazard_year_major$Group == 'Lightning',]
Major_Lightning <- merge(Major_Lightningf, yearlist2, "Year", all = TRUE)
Major_Lightning$freq[is.na(Major_Lightning$freq)] <- 0
nbmaj_Lightning <- fitdist(Major_Lightning$freq, "nbinom")
qmaj_Lightning <- quantile(nbmaj_Lightning, 0.8)

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Lightning") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_Lightning$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_Lightning$quantiles)
    modelledfreq$MajorEvents[x] = as.numeric(qmaj_Lightning$quantiles)
  } 
}

# Other 
Minor_Otherf <- hazard_year_minor[hazard_year_minor$Group == 'Other',]
Minor_Other <- merge(Minor_Otherf, yearlist2, "Year", all = TRUE)
Minor_Other$freq[is.na(Minor_Other$freq)] <- 0
nbminor_Other <- fitdist(Minor_Other$freq, "nbinom")
qminor_Other <- quantile(nbminor_Other, 0.80)

Medium_Otherf <- hazard_year_medium[hazard_year_medium$Group == 'Other',]
Medium_Other <- merge(Medium_Otherf, yearlist2, "Year", all = TRUE)
Medium_Other$freq[is.na(Medium_Other$freq)] <- 0
nbmed_Other <- fitdist(Medium_Other$freq, "nbinom")
qmed_Other <- quantile(nbmed_Other, 0.8)
medother <- 0.5

Major_Otherf <- hazard_year_major[hazard_year_major$Group == 'Other',]
Major_Other <- merge(Major_Otherf, yearlist2, "Year", all = TRUE)
Major_Other$freq[is.na(Major_Other$freq)] <- 0
nbmaj_Other <- fitdist(Major_Other$freq, "nbinom")
qmaj_Other <- quantile(nbmaj_Other, 0.8)
majother = 0.5

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Other") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_Other$quantiles)
    modelledfreq$MediumEvents[x] = medother
    modelledfreq$MajorEvents[x] = majother
  } 
}

# SevStorm 
Minor_SevStormf <- hazard_year_minor[hazard_year_minor$Group == 'Severe Storm/Thunder Storm',]
Minor_SevStorm <- merge(Minor_SevStormf, yearlist2, "Year", all = TRUE)
Minor_SevStorm$freq[is.na(Minor_SevStorm$freq)] <- 0
nbminor_SevStorm <- fitdist(Minor_SevStorm$freq, "nbinom")
qminor_SevStorm <- quantile(nbminor_SevStorm, 0.80)

Medium_SevStormf <- hazard_year_medium[hazard_year_medium$Group == 'Severe Storm/Thunder Storm',]
Medium_SevStorm <- merge(Medium_SevStormf, yearlist2, "Year", all = TRUE)
Medium_SevStorm$freq[is.na(Medium_SevStorm$freq)] <- 0
nbmed_SevStorm <- fitdist(Medium_SevStorm$freq, "nbinom")
qmed_SevStorm <- quantile(nbmed_SevStorm, 0.8)

Major_SevStormf <- hazard_year_major[hazard_year_major$Group == 'Severe Storm/Thunder Storm',]
Major_SevStorm <- merge(Major_SevStormf, yearlist2, "Year", all = TRUE)
Major_SevStorm$freq[is.na(Major_SevStorm$freq)] <- 0
nbmaj_SevStorm <- fitdist(Major_SevStorm$freq, "nbinom")
qmaj_SevStorm <- quantile(nbmaj_SevStorm, 0.8)

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Severe Storm/Thunder Storm") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_SevStorm$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_SevStorm$quantiles)
    modelledfreq$MajorEvents[x] = as.numeric(qmaj_SevStorm$quantiles)
  } 
}

# Tornado 
Minor_Tornadof <- hazard_year_minor[hazard_year_minor$Group == 'Tornado',]
Minor_Tornado <- merge(Minor_Tornadof, yearlist2, "Year", all = TRUE)
Minor_Tornado$freq[is.na(Minor_Tornado$freq)] <- 0
nbminor_Tornado <- fitdist(Minor_Tornado$freq, "nbinom")
qminor_Tornado <- quantile(nbminor_Tornado, 0.80)

Medium_Tornadof <- hazard_year_medium[hazard_year_medium$Group == 'Tornado',]
Medium_Tornado <- merge(Medium_Tornadof, yearlist2, "Year", all = TRUE)
Medium_Tornado$freq[is.na(Medium_Tornado$freq)] <- 0
nbmed_Tornado <- fitdist(Medium_Tornado$freq, "nbinom")
qmed_Tornado <- quantile(nbmed_Tornado, 0.8)

Major_Tornadof <- hazard_year_major[hazard_year_major$Group == 'Tornado',]
Major_Tornado <- merge(Major_Tornadof, yearlist2, "Year", all = TRUE)
Major_Tornado$freq[is.na(Major_Tornado$freq)] <- 0
nbmaj_Tornado <- fitdist(Major_Tornado$freq, "nbinom")
qmaj_Tornado <- quantile(nbmaj_Tornado, 0.8)

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Tornado") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_Tornado$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_Tornado$quantiles)
    modelledfreq$MajorEvents[x] = as.numeric(qmaj_Tornado$quantiles)
  } 
}

# Winter Weather 
Minor_Winterf <- hazard_year_minor[hazard_year_minor$Group == 'Winter Weather',]
Minor_Winter <- merge(Minor_Winterf, yearlist2, "Year", all = TRUE)
Minor_Winter$freq[is.na(Minor_Winter$freq)] <- 0
nbminor_Winter <- fitdist(Minor_Winter$freq, "nbinom")
qminor_Winter <- quantile(nbminor_Winter, 0.80)

Medium_Winterf <- hazard_year_medium[hazard_year_medium$Group == 'Winter Weather',]
Medium_Winter <- merge(Medium_Winterf, yearlist2, "Year", all = TRUE)
Medium_Winter$freq[is.na(Medium_Winter$freq)] <- 0
nbmed_Winter <- fitdist(Medium_Winter$freq, "nbinom")
qmed_Winter <- quantile(nbmed_Winter, 0.8)

Major_Winterf <- hazard_year_major[hazard_year_major$Group == 'Winter Weather',]
Major_Winter <- merge(Major_Winterf, yearlist2, "Year", all = TRUE)
Major_Winter$freq[is.na(Major_Winter$freq)] <- 0
nbmaj_Winter <- fitdist(Major_Winter$freq, "nbinom")
qmaj_Winter <- quantile(nbmaj_Winter, 0.8)
majwinter <- 0.5

for (x in 1:nrow(modelledfreq)) {
  if (modelledfreq$Group[x] == "Winter Weather") {
    modelledfreq$MinorEvents[x] = as.numeric(qminor_Winter$quantiles)
    modelledfreq$MediumEvents[x] = as.numeric(qmed_Winter$quantiles)
    modelledfreq$MajorEvents[x] = majwinter
  } 
}

# joining modelled freq to historical ratios
fulldata <- left_join(percentages2, modelledfreq, 'Group')

finalfrequencies <- fulldata %>%
  mutate(MinorFreq = ifelse(MinorCountPeril == 0, MinorEvents/6, MinorEvents*Minorpct),
         MediumFreq = ifelse(MediumCountPeril == 0, MediumEvents/6, MediumEvents*Mediumpct),
         MajorFreq = ifelse(MajorCountPeril == 0, MajorEvents/6, MajorEvents*Majorpct))

join1 <- left_join(finalfrequencies, severityminor, c('Group', 'Region'))
join2 <- left_join(join1, severitymed, c('Group', 'Region'))
join3 <- left_join(join2, severitymajor, c('Group', 'Region'))

pop <- data.frame(Region  = c(1, 2, 3, 4, 5, 6),
                  Population = c(6406008, 4386948, 5019684, 995544, 1257096, 313836))

freqsevpop <- left_join(join3, pop, 'Region')

freqsevpop$MediumSev <- replace_na(freqsevpop$MediumSev, median(freqsevpop$MediumSev, na.rm = 1))
freqsevpop$MajorSev <- replace_na(freqsevpop$MajorSev, median(freqsevpop$MajorSev, na.rm = 1))

finaldataset <- freqsevpop %>%
  mutate(minorsevpp = MinorSev/Population, 
         mediumsevpp = MediumSev/Population,
         majorsevpp = MajorSev/Population)

write.csv(finaldataset, "Final_Dataset.csv")


# OUTLIERS EDA

outlierdata <- final_data_cat %>%
  filter(Inflated.Damage.Final >= 50000000)

summary(outlierdata)

freq <- outlierdata %>%
  count(Year)

plot(freq, main = "frequency of extreme claims over time")
mean(freq$n)

peril <- outlierdata %>%
  count(Hazard.Event)

ggplot(peril, aes(x = Hazard.Event, y = n)) + 
  geom_bar(stat = "identity") + 
  ggtitle("Frequency of hazard events over time")



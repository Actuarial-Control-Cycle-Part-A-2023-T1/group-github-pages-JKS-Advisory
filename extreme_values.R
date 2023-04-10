install.packages('evd')
library('evd')
library('dplyr')
library('tidyverse')

final_data <- read.csv("final_mapped_dataset_w_other.csv")
population_growth <- read.csv("population_growth.csv")
population_growth <- population_growth[c(1,4)]

final_data <- left_join(final_data, population_growth, 'Year')
final_data$Inflated.Damage.Final <- final_data$Inflated.Damage * final_data$Cumulative


BY_YEAR <- final_data %>% 
  group_by(Year) %>%
  summarise(cost = sum(Inflated.Damage.Final))

#90th percentile
perc_90 <- quantile(final_data$Inflated.Damage.Final, 0.9)
fpot(final_data$Inflated.Damage.Final, perc_90)

#k = sqrt(3366)
k <- sqrt(nrow(final_data))
k <- round(k)
k_thresh <- sort(final_data$Inflated.Damage.Final,TRUE)[k]
fpot(final_data$Inflated.Damage.Final, k_thresh)

#k = 3366^(2/3)
k_2 <- nrow(final_data)^(2/3)
k_2 <- round(k_2)
k_2_thresh <- sort(final_data$Inflated.Damage.Final,TRUE)[k_2]
fpot(final_data$Inflated.Damage.Final, k_2_thresh)

#mean residual life plot
final_data$Inflated.Damage.Final <- final_data$Inflated.Damage.Final / 10
mrlplot(final_data$Inflated.Damage.Final)
fpot(final_data$Inflated.Damage.Final, 50000000)


tcplot(final_data$Inflated.Damage.Final, tlim = c(1000, 1000000000), std.err = FALSE)
dgpd(Catastrophic$Inflated.Damage.Final, scale = 1.366e+09, shape = 5.801e-01)


install.packages("eva")
library("eva")

mrlPlot(Catastrophic$Inflated.Damage.Final)

#nbinom works
chisq.test(Catastrophic$Inflated.Damage.Final)

nbinom_freq <- read_csv("nbinom_freq.csv")
nbinom_freq_FINAL <- nbinom_freq %>%
  group_by(freq) %>%
  tally()
nbinom_freq_FINAL$freq <- as.character(nbinom_freq_FINAL$freq)
summary(nbinom_freq_FINAL)


nbminor_cat <- fitdist(nbinom_freq$freq, "nbinom")
nbminor_cat_FREQ <- quantile(nbminor_cat, 0.8)

nbminor_cat$estimate['size']

plot(fitdist(nbinom_freq_FINAL$n,"nbinom"))


x <- 0:100
D <- dnbinom(x, size = nbminor_cat$estimate['size'], mu = nbminor_cat$estimate['mu'])

install.packages("goft")
library("goft")


#generalised pareto works H0 is that dist is gpd
gp_test(Catastrophic$Inflated.Damage.Final)

install.packages("evir")
install.packages("quantmod")

library("evir")
library("quantmod")

hist(final_data$Inflated.Damage.Final, 100, col=2)

#exponential q-q plot
qplot(final_data$Inflated.Damage.Final, xi=0)

emplot(final_data$Inflated.Damage.Final, 'xy')

meplot(final_data$Inflated.Damage.Final)

fit <- gpd(Catastrophic$Inflated.Damage.Final, threshold = 10)
tail(fit)
####################
riskmeasures(fit, 0.975)
####################

plot(final_data$Year, final_data$Inflated.Damage.Final)










library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(stringr)

rm(list=ls())

setwd('~/Data-332/Assignment')

df_truck <- read_excel('NP_EX_1-2.xlsl',
                       sheet = 2, skip = 3, .name_repair = 'universal')
# selecting_columns

df <- df_truck [, c(4:15)]

# deselct_columns

df <- subset(df, select = -c(...10))

date_min <- min(df$Date)
date_max <- max(df$Date)

number_of_days_on_the_road <- date_max - date_min
print(number_of_days_on_the_road)

days <- difftime(max(df$Date), min(df$Date))
print(days)
number_of_days_recorded <- nrow(df)

total_hours <- sum(df$Hours)
avg_hrs_per_day_rec <- round(total_hours / number_of_days_recorded, digits = 3)
print(avg_hrs_per_day_rec)

df$fuel_cost <- df$Gallons * df$Price.per.Gallon

df$total_cost <- df$Tolls + df$Misc + df$fuel_cost

df[c('warehouse', 'city_state')] <-
  str_split_fixed(df$Starting.Location, ',',2)

df$Other_Expenses <- df$Tolls + df$Misc + df$fuel_cost

df$Miles_driven <- df$Odometer.Ending - df$Odometer.Beginning

df$Miles_per_gallon <- df$Miles_driven / df$Gallons

df$Total_cost_per_mile <- df$total_cost / df$Miles_driven
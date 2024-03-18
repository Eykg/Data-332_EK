library(readxl)
library(readcsv)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

rm(list = ls())

setwd('~/Data-332/Assignment/Patient_Billingdata')

# Load the data
df_billing <- read_excel("Billing.xlsx")
df_Patient <- read_excel("Patient.xlsx")
df_Visit <- read_excel("Visit.xlsx")

# Convert dates
df_Visit$VisitDate <- as.Date(df_Visit$VisitDate)

# Merge visit data with patient data
merged_data <- left_join(df_Visit, df_Patient, by = "PatientID")

# Filter visits before 2021
EarlierVisits <- merged_data %>%
  filter(VisitDate < as.Date("2021-01-01"))

# Summarize visits by city
patients_all_city <- merged_data %>%
  group_by(City) %>%
  summarise(number = n())

# Example visualization: Number of visits per city
ggplot(patients_all_city, aes(x = reorder(City, number), y = number, fill = City)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Number of Visits per City", x = "City", y = "Number of Visits") +
  coord_flip()

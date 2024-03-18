library(readxl)
library(readcsv)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

rm(list = ls())

setwd('~/Data-332/Assignment/Patient_Billingdata')

billing_data <- read_xlsx('Billing.xlsx')
patient_data <- read_xlsx('Patient.xlsx')
Visit_data <- read.csv('Visit.txt')

names(Visit_data)[names(Visit_data) == "X13272"] <- "Visit-ID"

merged_data <- left_join(billing_data, patient_data,by = c("VisitID" = "PatientID"))
merged_data$VisitID <- as.numeric(merged_data$VisitID)

merged_data_2<-left_join(Visit_data, merged_data, by = c("Visit-ID"="VisitID"))
# Rename the "Influenza" column to "Reason"

merged_data_2 <- merged_data_2 %>% rename(Reason = Influenza)

reason <- merged_data_2 %>%
  group_by(Reason) %>%
  summarise(Count = n())

library(ggplot2)

chart1 <- ggplot(reason, aes(x = Reason, y = Count, fill=Reason)) +
  geom_col() +
  labs(title = "Reason Count Plot", x = "Reason", y = "Count") +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
chart1
library(ggplot2)

reason_l <- patient_data %>%
  group_by(Zip) %>%
  summarise(Count = n())
reason_l <- merged_data_2 %>%
  group_by(Reason) %>%
  summarise(Count = n())

chart_by_location <- ggplot(reason_l, aes(x = Zip, y = Count, fill = Reason)) +
  geom_col(position = "stack") +
  labs(title = "Reason for Visit by Zip Code", x = "Zip Code", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels if needed

chart_by_location

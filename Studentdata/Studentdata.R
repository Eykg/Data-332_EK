library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

rm(list = ls())

setwd('~/Data-332/Assignment/Studentdata')

students <- read_excel("Course.xlsx")
course_data <- read_excel("Registration.xlsx")
registration <- read_excel("Student.xlsx")

# Corrected variable name in the next line from Registration_data to course_data
merged_data <- left_join(course_data, students, c = "Instance_ID")

majors_pivot <- merged_data %>%
  group_by(Title) %>%
  summarize(Count = n())

# Chart on the number of majors (TITLE)
majors_chart <- ggplot(merged_data, aes(x = Title, fill = Title)) +
  geom_bar() +
  labs(title = "Number of Majors",
       x = "Major Title",
       y = "Number of Students") +
  theme_minimal()

# Total cost per major segment by payment plan
cost_chart <- ggplot(merged_data, aes(x = Title, y = Total_Cost, fill = Payment_Plan)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Total Cost per Major, Segmented by Payment Plan",
       x = "Major Title",
       y = "Total Cost") +
  theme_minimal()

# Total balance due by major, segmented by payment plan
balance_chart <- ggplot(merged_data, aes(x = Title, y = Balance_Due, fill = Payment_Plan)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Total Balance Due per Major, Segmented by Payment Plan",
       x = "Major Title",
       y = "Total Balance Due") +
  theme_minimal()


cost_pivot <- merged_data %>%
  group_by(Title, `Payment Plan`) %>%
  summarize(`Total Cost` = sum(`Total Cost`))

ggplot(majors_pivot, aes(x = Title, y = Count, fill = Title)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of Majors",
       x = "Major Title",
       y = "Number of Students") +
  theme_minimal()


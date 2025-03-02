library(tidyverse)

# view dataset
View(msleep)

my_data <- msleep %>%
  # selecting the column(variable) i want
  select(name, sleep_total) %>%
  
  # filtering the row to the below condition
  # animals tht does not sleep more than 18 hours
  filter(!sleep_total > 18)

#--------------------------------------------  
# 2
my_data <- msleep %>%
  # selecting the column(variable) i want
  select(name, order, bodywt, sleep_total) %>%
  
  # filtering the row to the below condition
  # comma here means and. so both condition must be met for the 
  # row to be extracted
  filter(order == "Primates",  bodywt > 20) 

#--------------------------------------------  
# 3
my_data <- msleep %>%
  # selecting the column(variable) i want
  select(name, order, bodywt, sleep_total) %>%
  
  # filtering the row to the below condition
  # | here means or. so only one of condition must be met for the 
  # row to be extracted
  filter(order == "Primates" |  bodywt > 20) 

# multiple or statements
my_data <- msleep %>%
  # selecting the column(variable) i want
  select(name, sleep_total) %>%
  
  # filtering the row to the below condition
  # | here means or. so only one of condition must be met for the 
  # row to be extracted
  filter(name == "Cow" |
           name == "Dog" |
           name =="Goat") 

#--------------------------------------------  
# 4
# more elegant way of multiple or statements
# multiple or statements
my_data <- msleep %>%
  # selecting the column(variable) i want
  select(name, sleep_total) %>%
  
  # using c and %in%
  filter(name %in% c("Cow", "Dog", "Goat"))
         
#--------------------------------------------  
# 5 between. we want to filter out variable betweeen x and y

my_data <- msleep %>%
  select(name, sleep_total) %>%
  
  # this means filter sleep total between 16 and 18 hours
  filter(between(sleep_total, 16, 18))

#--------------------------------------------  
# 6 near.say we want to find column tht approximately close to a specified value
# say i want 10 hours, but i also want near it so maybe 10.5 or 9.5, depending on the range i set

my_data <- msleep %>%
  select(name, sleep_total) %>%
  
  # so anything near 17 as long as its between range of 0.5 (tolerance)
  filter(near(sleep_total, 17, tol = 0.5))

#--------------------------------------------  
# 7 is.na. finds the NA in a specified column

my_data <- msleep %>%
  select(name, conservation, sleep_total) %>%
  
  # so for the column conservation, itll give me all the NAs
  filter(is.na(conservation))

#--------------------------------------------  
# 8 !is.na. and the opposite is as such

my_data <- msleep %>%
  select(name, conservation, sleep_total) %>%
  
  # so for the column conservation, itll give me all the NON NAs
  filter(!is.na(conservation))









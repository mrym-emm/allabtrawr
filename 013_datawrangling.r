# data wrangling
library(tidyverse)

data() # list of all datasets in tidyvese

# View dataset
?msleep
glimpse(msleep) # overview of str/datatypes etc of each variables
View(msleep)

# Rename a variable
msleep %>% 
  # renaming the column (new name = old name)
  rename("conserv" = "conservation") %>% 
  glimpse()

# Reorder variables
msleep %>% 
  # will select according to which order you put in select
  select(vore, name, everything())

# attach(msleep)

# change variable type
class(vore) # by default its character, since i wanna categorize it, best to change it to factor

# to change better use $
msleep$vore <- as.factor(msleep$vore)
class(vore)
glimpse(msleep)

# way to convert in tinyverse
msleep %>% 
  mutate(vore = as.factor(vore)) %>% 
  glimpse()


# Select variables to work with
names(msleep)

msleep %>% 
  select(2:4, 
         awake, 
         # variables tht starts with sleep
         starts_with("sleep"),
         
         # variables containing 'wt'
         contains("wt")) %>% 
  names()

# Filter & arrange data
unique(msleep$order) # will return all the unique observations in the order variable

msleep %>% 
  filter(order %in% c("Carnivora", "Primates") & 
           sleep_total > 8)  %>% 
  select(name, order, sleep_total) %>% 
  
  # arranges the observation in the sleep_total desc
  arrange(-sleep_total) %>% 
  
  View()

# change observations (mutate)
msleep %>% 
  mutate(brainwt = brainwt * 1000) %>% 
  view()


# change observations (mutate)
msleep %>% 
  # added a new variable , while maintaing original
  mutate(brainwt_grams = brainwt * 1000) %>% 
  view()

# conditional changes (if_else)
## logical vector based on a condition

msleep$brainwt
msleep$brainwt > 0.01 # returns a logical vector per condition


size_of_brain <- msleep %>% 
  select(name, brainwt) %>% 
  # drop the na in thi variable
  drop_na(brainwt) %>% 
  
  # creates a new variable per the condition
  mutate(brain_size = if_else(brainwt > 0.01,
                              "large",
                              "small"))

size_of_brain

# Recode data & rename a variable
## change observations of "large" and "small" into 1 and 2
size_of_brain %>% 
  # recode just shuffles it around the way we want it to
  mutate(brain_size = recode(brain_size,
                             "large" = 1,
                             "small" = 2)) %>% 
  arrange(brain_size)


# Reshaping data from wide to long or long to wide
library(gapminder)
View(gapminder)

data <- select(gapminder, country, year, lifeExp)
View(data)

# widing the data
wide_data <- data %>% 
  pivot_wider(names_from = "year", values_from = "lifeExp")

View(data)
View(wide_data)

# how abt reverting it?
long_data <- wide_data %>% 
  pivot_longer(2:13,
               names_to = "year",
               values_to = "lifeExp")
View(long_data)

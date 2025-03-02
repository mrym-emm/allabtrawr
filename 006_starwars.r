# load tidyverse
require(tidyverse)

# to see all the dataset in tidyerse
data()

# view dataset
View(starwars)

# %>% means and then
starwars %>% 
  select(gender, mass, height, species) %>%
  filter(species == "Human") %>%
  
  # this removes the row with NA
  na.omit() %>%
  
  # this converts the height from cm to m
  mutate(height = height / 100) %>%
  
  # this not only creates a new column but also inserts the value
  mutate(BMI = mass / height^2) %>% 
  
  # after grouping i need to summarize, else it wont show any changes 
  group_by(gender) %>%
  
  summarise(Average_BMI = mean(BMI))







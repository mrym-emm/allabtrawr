# calling tidyverse
library(tidyverse)

sw <- starwars %>%
  # i want to order it by name height mass gender then everything else
  select(name, height, mass, gender, everything())

sw1 <- starwars %>%
  # i want to order it by name height mass gender then everything else
  select(name, height, mass, gender) %>%

    # rename mass column to weight
  rename(weight = mass) %>%
  
  # removes missing value
  na.omit() %>%
  
  # converts the existing height column from cm to m
  mutate(height = height/100) %>%
  
  # filter masculine and feminine
  # one way of doing -> filter(gender == "masculine" | gender == "feminine" )
  
  filter(gender %in% c("masculine", "feminine")) %>%
  
  # to recode the gender into shortforms (recode(colname, wht we want to change = change))
  mutate(gender = recode(gender,
                         masculine = "m",
                         feminine = "f")) %>%
  
  # create new column with the following rules
  mutate(size = height > 1 & weight > 75,
         
         # then continue by saying tht if TRUE, change it to big else, small
         size = if_else(size == TRUE, "big", "small"))
  
  
  



str(sw1) 
  

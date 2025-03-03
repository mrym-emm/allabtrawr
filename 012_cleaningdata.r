# Steps:
# Explore, Clean, Manipulate, Describe & summarise, Visualize, Analyze

########################
#####CLEANING DATA######
########################
# wht is clean data:-
# variable types
# select & filter
# find n deal with missing data
# find n deal with duplicates
# recoding values
########################

# import tidyverse
library(tidyverse)

# view dataset
View(starwars)


# Variable types
# 1) glimpse
glimpse(starwars) # remember factor is just another word for categorical

# so no need $
attach(starwars)

# initially the class for gender is chr so i wanna change it to a factor
class(gender)
unique(gender)

# this will overwrite the current variable
gender <- as.factor(gender) # now gender willl be factor
class(gender)

# the unique values tht a categorical variable can take on
levels(gender)

# say i want it in a certain order. currently its fem then mas. this is how we do it
gender <- factor((gender), 
                 levels = c("masculine",
                            "feminine"))
levels(gender) # so now this will be mas then fem

# select variables. names() will return all the variable in the dataset
names(starwars)

starwars %>% 
  
  # ends_with("somethin") will take the variable tht ends with "color", like hair, eye
  select(name, height, ends_with("color"))

# filter observations
unique(hair_color)

View(starwars %>%  
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") &
           height < 180))


# Missing data (its not advisable to remove missing data unless we truly understand it)
mean(height, na.rm =TRUE)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  
  # this line is not recommended bcs you might remove important data
  na.omit()


# advisable route for missing data
starwars %>% 
  select(name, gender, hair_color, height) %>%
  # this means give non complete cases (no NAs)
  filter(!complete.cases(.)) %>% 
  drop_na(height)

# removing NA in height variable
starwars %>% 
  select(name, gender, hair_color, height) %>%
  # this means give non complete cases (no NAs)
  drop_na(height) %>% 
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  # this will overwrite the current column
  mutate(hair_color = replace_na(hair_color, "none"))


### how to deal with duplicates ###
# dummy data: Peter 22 is repeated twice
Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 26, 30, 22)

friends <- data.frame(Names, Age)

# select subset where not duplicates
friends[!duplicated(friends), ]

#another way of removing duplicates
friends %>% 
  distinct() %>% 
  View()

# recoding variables
starwars %>%  
  select(name, gender)

# maybe i want the masculine and femine to be coded as 1 and 2
starwars %>%  
  select(name, gender) %>% 
  mutate(gender = recode(gender,
                         "masculine" = 1,
                         "feminine " = 2))

gender









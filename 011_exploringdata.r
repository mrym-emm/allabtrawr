# to remove everything from Global environment
# rm(list = ls())

# import tidyverse
library(tidyverse)

# all datasets in R
data()

# dont know something, ASK (?)
?starwars

# dimension of dataframe -> rows(observation), cols(var)
dim(starwars)

# structure of dataframe
# str(starwars) # could be messy
# allows a glimpse of the dataframe, ie: gives me the variable and its type
glimpse(starwars)

# to view dataset in new tab
View(starwars)

# gives first and last  rows
head(starwars)
tail(starwars)

# so takyah $ anymore
attach(starwars)

# to know the variables(column names)
names(starwars)

# to know how many columns
length(starwars)

# class of variable
class(hair_color)

# number of observation(rows) in hair_color
length(hair_color)

# to see unique observation in the column
unique(hair_color)

# good tip
# 1. making a new table of just hair color
table(hair_color)

# 2. say i wanna sort it
sort(table(hair_color))

# 3. maybe in decreasing manner?
sort(table(hair_color), decreasing = TRUE)

# opens a new tab to see the subset of the df. the View helps make it readable
View(sort(table(hair_color), decreasing = TRUE))

# even better, can use barplot
barplot(sort(table(hair_color), decreasing = TRUE))


# the above is without tidyverse. lets use tidyverse using pip
 starwars %>%
   # selects hair color
   select(hair_color)%>%
   
   # count how many for each observation
   count(hair_color) %>%
   
   # if we dont put n, it will arrange alphabetical, else it will based on frequency
   arrange(desc(n)) %>%
   
   # view in newtab
   View()

# remember: dataframe[which row, which column]. if not specified then itll take all
# its a great tip to view all na in each variable/column
starwars[is.na(hair_color),]

# to get a sense of which observation in the hair color has NA. TRUE means yas
is.na(hair_color)

View(starwars[is.na(hair_color),])


View(starwars)

# exploring height variable
class(height)
length(height)
summary(height)

# boxplot
boxplot(height)

# histogram
hist(height)


# one of the condition of applying statistical function to anumeric variable, is the distribution is normal




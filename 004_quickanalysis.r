my_data <- read.csv("friends.csv")

# View data (first 6 rows)
head(my_data)

# show last 6 rows
tail(my_data)

# will open datafile in new tab
View(my_data)


# extracting components from df
# rows are observations
# columns are variables
my_data[1, 3] #row 1, col 3

my_data[,3] # all of col 3

# or specify column name
my_data$Eye.colour

# import libraries
library("tidyverse")
require("tidyverse")

# start analysis
# think of the pipe (%>% as an arrow)
my_data %>% 
  select(Name, Age, Height) %>%
  filter(Age < 24 & Height > 1.78) %>%
  arrange(Height)

# from my_data, select the NAME,AGE,HEIGHT COLUMN, then FILTER to to those below 24 
# and HEIGHT above 1.78 and arrange it according to HEIGHT

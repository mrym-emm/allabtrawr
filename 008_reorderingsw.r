# calling tidyverse
library(tidyverse)

sw <- starwars %>%
  # i want to order it by name height mass gender then everything else
  select(name, height, mass, gender, everything())

sw1 <- starwars %>%
  # i want to order it by name height mass gender then everything else
  select(name, height, mass) %>%

    # rename mass column to weight
  rename(weight = mass)

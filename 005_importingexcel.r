# importing excel into R

# can also use require
library(readxl)
my_data <- read_excel("friends.xlsx", sheet = "Sheet2", 
                      range = "C1:G21", na = "**")

#command for help
?read_excel

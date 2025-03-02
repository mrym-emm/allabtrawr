my_age <- 26
your_age <-25

# finding sum
sum(my_age, your_age)

# -------------------generating dummy data-------------
# generating 50 rows of speed & distance data
set.seed(47) # for reusability

speed <- sample(4:25, 50, replace =TRUE) # random speeds
# dist <- sample(2:40, 50, replace =TRUE) # random distance

# this makes more sense tha random distance lol
dist <- round(speed^2 / 2 + rnorm(50, mean = 0, sd = 5), 0)

# create dataframe with dummy data
cars_data <- (data.frame(speed, dist))

# -----------------------------------------------
#plot scatter plot
plot(cars_data)

# plot histogram. format is hist(df$colname)
hist(cars_data$speed)

# fun trick!
attach(cars_data) # lepas ni xyah guna cars$var...

# now:
hist(dist)

# sumary of whole df
summary(cars_data)

# summary of a specific columnl ie dist or speed
summary(speed)

# checking data type of variable/column/df
class(cars_data)
class(speed)
class(dist)

# length of each variable ie rows in a column
length(speed)
length(dist)

# unique values (useful for categorical rather than numerical)
unique(speed)
unique(dist)

# first 6 rows
head(cars_data)

# last 6 rows
tail(cars_data)

# R starts from 1 not 0
# extracting subset in data: dataframe[wht row you want, which colum]
subset <- cars_data[3:6, 1:2]

# if i need help, which is always
?median

# median
median(dist)

# so if theres NA in your variable, then we need to tweak something
new_data <- c(2,4,6,4,NA,9)
new_data

# just writing this will return NA
median(new_data)

# set na.rm (remove na) to TRUE, so it wont consider NAs
median(new_data, na.rm = TRUE)







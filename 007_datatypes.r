friends <- read.csv("friends.csv")
friends

# is used to display the stucture of the object/dataframe
str(friends)

# since I want to group them according to eye color, id need to change the-
# eye color column from a chr to a factor (cetegorical variable)

friends$Eye.colour <- as.factor(friends$Eye.colour)

# to change number to integer use `as.integer(colname)`
# i dont have to change anything bcs my height is already in integer
# num is decimal fyi

# this provides access to the attributes in the variable eye colo
levels(friends$Eye.colour)

# say I wanna reorder how R sees the eye color from blue brown green to 
# green blue brown
friends$Eye.colour <- factor(friends$Eye.colour,
                             levels = c("Green", "Brown", "Blue"))

# returns a logical vector. this creates a new column in the df accrding
# to our logical
friends$older_than_23 <- friends$Age > 23

friends

class(friends$older_than_23)

 


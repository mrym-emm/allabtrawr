# assign to var read csv file
df <- read.csv("friends.csv")

# to see dataframe
df

# mean of age __$colname
mean(df$Age)

# median of height
median(df$Height)

# histogram
hist(df$Age)

# plot x against y
plot(df$Age ~ df$Height)

# checking correlation between Age and Height -> 1(strong pos), -1(strong neg)
# 0 (weak/no correlation)
cor.test(df$Height, df$Age)

# p < 0.05 → Significant correlation (strong evidence of a relationship).
# p < 0.01 → Very strong correlation.
# p > 0.05 → Not significant (likely due to random chance).

# plot more details
plot(df$Age ~ df$Height, main = "Age vs Height",xlab ="Height", ylab ="Age")


# need to convert to factor
class(df$Sex)
df$Sex <- as.factor(df$Sex)
boxplot(df$Sex, df$Age, xlab="Sex")

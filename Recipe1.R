## ------------------------------------------------------------------------
# Let's load some pre-defined R data
data(mtcars)
help (mtcars)
# Let's peek into the data
head(mtcars)
# Let's see its structure
str(mtcars)

## ------------------------------------------------------------------------

# Let's calculate the average MPG consumption
mean(mtcars$mpg)
# Let's calculate the standard deviation
sd(mtcars$mpg)
# Shortcut, calculate  summary statistics
summary(mtcars$mpg)

# let's generate an histogram of the mpg variable with 10 bars
hist(mtcars$mpg,breaks=10,main="Histogram of MPG", xlab="Miles per Gallon (MPG)")
# Let's draw a vertical line at the mean
abline(v=mean(mtcars$mpg),col="red",lty=2)

# Calculate some bi-variate stats
#let's plot MPG vs weight
plot(mtcars$wt,mtcars$mpg, main="Automobile MPG vs Weight", ylab="Miles per Gallon (MPG)",xlab="Weight (lb/1000) ")

#There is a clear (inverse) relationship between both
#Let's calculate correlation
cor(mtcars$mpg,mtcars$wt)


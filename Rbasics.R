## ----assigning values to variables---------------------------------------
#Let's create variables of different types
#numeric
my_num1<- 15
print (my_num1)

#character
my_string<- "Hello world"
print (my_string)

#logical
my_bool<- TRUE
print (my_bool)

## ----arithmetics---------------------------------------------------------
# We can do operations with the variables
my_num1<-15
my_num2<-5
#substraction
my_num1-my_num2
#addition
my_num1+my_num2
#multiplicatoin
my_num1*my_num2
#division
my_num1/my_num2
# power
my_num1^2
#square root
sqrt(my_num1 *my_num2)

## ----data types----------------------------------------------------------
# Let's review the internal representation of the variables

# Numeric: default number (float)
class(my_num1)

#Character: strings are characters
class(my_string)

#Logicals: booleans
class(my_bool)

## ----vectors-------------------------------------------------------------
#You can create a list of variables with the combine **c()** command
ranks<-c(1,2,3,4)
print(ranks)
# Vectors preserve the class of its elements
class(ranks)
#You can access the specific elements **INDEX 1**
print(ranks[1] )
# You can perform element-wise ops in vectors
weights<-c(78.0,66.0,90.0,55.5)
heights <-c(181.0,160.0,190.0,170.0)

#e.g. division
ratios<-weights/heights

# You can have vectors of characters
names<-c("John","Mary","Bob","Anna")
affiliations<-c("QF","QP","QP","QF")
# Or logicals
is_fit<-c(TRUE,FALSE,TRUE,FALSE)


## ----str function--------------------------------------------------------
# **str**: Structure: tells you about the variable(s) class, size and values
str(my_num1)
str(my_string)
str(weights)

## ----summary function----------------------------------------------------
# **summary**: Gives you a summary of a variable. 
# Specially useful for lists/vectors

summary(weights)

## ------------------------------------------------------------------------
#Let's factorize the affiliation vector
f_affiliations<-factor(affiliations)
print(f_affiliations)
#Now let's compare
str(f_affiliations)
str(affiliations)
#Even summaries are different
summary(f_affiliations)
summary(affiliations)


## ------------------------------------------------------------------------
my_df <- data.frame(name=names,affiliation=affiliations,weight=weights,height=heights,is_fit=is_fit)
# The command head shows us a preview of the dataset
head(my_df)
# We can see its structure
str(my_df)
# Or a complete summary
summary(my_df)

## ------------------------------------------------------------------------
#print the column name
my_df$name

## ------------------------------------------------------------------------
my_df$weight

## ------------------------------------------------------------------------
plot(my_df$weight,my_df$height,xlab="Weight",ylab="Height")


## ------------------------------------------------------------------------
#This is the wrong way because affiliation is taken as a numeric
plot(my_df$weight,my_df$affiliation,xlab="Weight", ylab="Affiliation")

## ------------------------------------------------------------------------
# Instead, we use the "by" operator "~". 
#Note that this operator works as y~x. So now the axes are reversed
plot(my_df$weight~my_df$affiliation,ylab="Weight",xlab="Affiliation")


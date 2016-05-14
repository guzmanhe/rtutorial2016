## ------------------------------------------------------------------------
#install.packages('plyr')
#install.packages('xtable')

## ------------------------------------------------------------------------
library("plyr")

## ------------------------------------------------------------------------
data(mtcars)
#summarize MPG data in mtcars by number of cylinders
ddply(mtcars,.(cyl),summarize,avg_MPG=mean(mpg))

#summarize MPG data in mtcars by transmission
ddply(mtcars,.(am),summarize,avg_MPG=mean(mpg))
# Let's modify am into a factor with labels 0="AUTOMATIC",1="MANUAL"
mtcars$f_am<-factor(mtcars$am,levels=c(0,1),labels=c("AUTOMATIC","MANUAL"))
# Now, let's summarize it again by the new factor
ddply(mtcars,.(f_am),summarize,avg_MPG=mean(mpg))

#summarize MPG and weight data in mtcars by number of cylinders and transmission
my_table<-ddply(mtcars,.(cyl,f_am),summarize,avg_MPG=mean(mpg),avg_WT=mean(wt))
print(my_table)


## ----results='asis'------------------------------------------------------
library(xtable)

xtab<-xtable(my_table,caption="Average Consumption per number of cylinders", label="lab:avgmpg")
print(xtab,type="latex")


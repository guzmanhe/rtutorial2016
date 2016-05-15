## ----load data-----------------------------------------------------------

df <-read.table("data/mte_metrics.dat",header=FALSE,col.names=c("metric","lang_pair","testset","system","score") )
# The data looks a bit different than in the previous exercise
head(df)

## ----bar plot------------------------------------------------------------
# load ggplot2
library(ggplot2)

# If we just use the geom bar over the original data, it will create a frequency distribution (histogram) by the variable of interest (lang pair)
ggplot(df,aes(x=lang_pair))+geom_bar()
# But this is not very useful because we want a comparison of scores between BLEU and DR_LEX

#Let's add scores into the picture
ggplot(df,aes(x=lang_pair,y=score))+geom_bar(stat="identity") # we need to tell ggplot that we want to use the value of y "as_is" to determine the height of the bars.

#Still this picture is not useful, because we can't compare the two metrics
#Let's color the bars
ggplot(df,aes(x=lang_pair,y=score,fill=metric))+geom_bar(stat="identity")
#This is not a good graph because it is "stacking the graphs". Let's put them side by side

ggplot(df,aes(x=lang_pair,y=score,fill=metric))+geom_bar(stat="identity", position="dodge")
# This is more useful!


## ----summary-------------------------------------------------------------
#we use ddply to obtain average scores by metric and language pair
library(plyr)
summary<-ddply(df,.(lang_pair,metric),summarize,avg_score=mean(score))
print(summary)

## ----alternative plot over summaries-------------------------------------

ggplot(summary,aes(x=lang_pair,y=avg_score,fill=metric ))+geom_bar(stat="identity",position="dodge")


## ----facetting the metric------------------------------------------------
ggplot(summary,aes(x=lang_pair,y=avg_score,fill=metric))+geom_bar(stat="identity")+
  facet_grid(.~metric)  #this wil facet horizontally using the factor  metric

## ----facetting the lang pair---------------------------------------------
ggplot(summary,aes(x=metric,y=avg_score,fill=metric))+geom_bar(stat="identity")+
  facet_grid(.~lang_pair) 

## ----prepare and print---------------------------------------------------

my_plot<- ggplot(summary,aes(x=metric,y=avg_score,fill=metric))+geom_bar(stat="identity",width=0.9)+  facet_grid(.~ lang_pair) + ggtitle("Comparison of average system scores of two MTE metrics") + xlab("MTE metrics")+ ylab("Average scores over systems") +scale_fill_manual(values = c("BLEU"="blue","DR_LEX"="green"))

pdf("img/my_second_plot.pdf",height=5,width=7)
print(my_plot)
dev.off()


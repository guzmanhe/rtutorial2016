## ------------------------------------------------------------------------




## ------------------------------------------------------------------------
# load ggplot2

library(ggplot2)
library(reshape2)
library(plyr)

ggplot(df,aes(x=score,fill=metric))+geom_bar(col='red')
summary<-ddply(df,.(lang_pair,metric),summarize,avg_score=mean(score))
ggplot(summary,aes(x=lang_pair,y=avg_score,fill=metric ))+geom_bar(stat="identity",position="dodge")
ggplot(summary,aes(x=metric,y=avg_score,fill=lang_pair ))+geom_bar(stat="identity",position="dodge")





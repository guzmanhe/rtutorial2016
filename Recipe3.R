## ----install ggplot2-----------------------------------------------------
#Let's install gglot (ggplot2) through the command line
install.packages('ggplot2')
library('ggplot2')


## ----read data-----------------------------------------------------------
# We use read.table, we give the arguments:
# header=false, indicating that the columns names are not in the first line of the dataset
# col.names, indicating the names of the columns manually,
# sep, the separator (default "\t" tab)
 df <-read.table('data/mte_metrics2.dat',header=FALSE,col.names = c("lang_pair","testset","system","BLEU","DR_LEX"), sep="\t")

#let's look at the head
head(df)

#this file shows the scores given by two different MT metrics: BLEU and DR_LEX to the same set of translation systems


## ------------------------------------------------------------------------
#Let's plot the basic ggplot
# here we give the dataframe
# the aes= aesthetics
# and then the geometry, in this case we want a scatter plot of BLEU vs DR_LEX
ggplot(df,aes(x=BLEU,y=DR_LEX)) + geom_point()

#Now, let's color each datapoint according to the language pair of the system
# to do this, we specify another aesthetic, which only applies to the geom_point
ggplot(comparison,aes(x=BLEU,y=DR_LEX)) + geom_point(aes(col=lang_pair))
#Now, let's add a trendline (by default, loess trendline)
ggplot(comparison,aes(x=BLEU,y=DR_LEX)) + geom_point(aes(col=lang_pair)) +geom_smooth()
# We could choose a linear trendline "lm"= linear model
ggplot(comparison,aes(x=BLEU,y=DR_LEX)) + geom_point(aes(col=lang_pair)) +geom_smooth(method="lm")

#If we want, we can modify the scale, so both metrics are plotted from 0..1 (not very helpful)
ggplot(comparison,aes(x=BLEU,y=DR_LEX)) + geom_point(aes(col=lang_pair)) +geom_smooth(method="lm") + ylim(0,1)+xlim(0,1)

#Let's go back to the previous version and add a title (ggtitle)
ggplot(comparison,aes(x=BLEU,y=DR_LEX)) + geom_point(aes(col=lang_pair)) +geom_smooth(method="lm")+ ggtitle("BLEU vs DR-LEX at the system level")+xlab("BLEU score")+ylab("Lexicalized discourse score (DR-LEX)")
myplot<-ggplot(comparison,aes(x=BLEU,y=DR_LEX)) + geom_point(aes(col=lang_pair)) +geom_smooth(method="lm")+ ggtitle("BLEU vs DR-LEX at the system level") 

## ----saving--------------------------------------------------------------
# Saving to a file is done via "devices". By declaring a PDF device, we tell R to plot the
pdf("img/my_first_ggplot.pdf",height=10,width=10) #you can control the aspect by modifiying the width/height
print(myplot)
dev.off() # we tell to finish writing in the pdf device



#Association Rule


#install.packages("arules")
library("arules")
rm(list=ls())

# This is our transaction set.
trans <- read.transactions("groceries.csv",  sep=",")

#(a) Most Frequent Item
#According to Graph and summary function, whole Milk is most frequent item having frequency  2513
summary(trans)
itemFrequencyPlot(trans, topN=5, type="absolute")

#(b) Least Frequent Item
#According to graph baby food and sound storage medium are having least frequency with frequency 1
barplot(sort(table(unlist(LIST(trans))))[1:5],
        horiz=TRUE,
        las=1,
        xlab='')

#(c)
rules <- apriori(trans, parameter = list(support=0.009, confidence = 0.25))
summary(rules)

#(D)Top 5 Rules sorted by support
inspect(head(rules, by="support")[1:5])

#(E) Top 5 Rules sorted by confidence
inspect(head(rules, by="confidence")[1:5])

#(F) Top 5 Rules sorted by lift
inspect(head(rules, by="lift")[1:5])

#(G) Bottom 5 Rules sorted by Support
inspect(tail(rules, by ="support")[1:5])

#(H) Bottom 5 Rules sorted by Confidence
inspect(tail(rules, by ="confidence")[1:5])

#(I) Bottom 5 Rules sorted by Lift
inspect(tail(rules, by ="lift")[1:5])

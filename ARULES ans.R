####for book###

install.packages("arules") # install the package
library("arules") # invoke the package
install.packages("readxl")
library(readxl)
book <- read_xlsx(file.choose(),1)
View(book)# Read xlsx file

rules <-  apriori(as.matrix(book),parameter=list(support=0.02,confidence=0.7,minlen=5)) 
?apriori

inspect(rules)

inspect(sort(rules, by="lift"))
inspect(head(sort(rules, by="lift")))
head(quality(rules))
#####for graph#####
install.packages("arulesViz")
library(arulesViz)

plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")


#####for movies######
library(readxl)

movies <- read_xlsx(file.choose(),1)
View(movies)# Read xlsx file

rules <-  apriori(as.matrix(movies[,6:15]),parameter=list(support=0.1,confidence=0.6 ,minlen=1)) 
?apriori

inspect(rules)

inspect(sort(rules, by="lift"))
inspect(head(sort(rules, by="lift")))
head(quality(rules))
library(arulesViz)

plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")


######for groceries#######

library(arules)
groceries <- read.transactions(file.choose(),format = "basket")

inspect(groceries[1:10])
class(groceries)
summary(groceries)
# itemFrequencyPlot can be applicable only for transaction data
# count of each item from all transactions
itemFrequency(groceries,topN=20)
groceries_rules<- apriori(groceries,parameter = list(support=0.002,confidence=0.05 ,minlen=2))

inspect(rules[1:5])

inspect(sort(rules, by="lift"))
inspect(head(sort(rules, by="lift")))
head(quality(rules))                          

library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")
plot(groceries_rules,method = "mosaic")

#reading in table

library(data.table)
library(ggplot2)

Affairs <- read.csv("~/Desktop/Affairs.csv", sep=";", stringsAsFactors=TRUE)
#View(Affairs)

summary(Affairs)

yearsmarried <- Affairs$yearsmarried
Nb_affairs <- Affairs$Nb_affairs
  
plot(Nb_affairs,yearsmarried,type = "l", col = "blue", xlab = "No Affairs", ylab = "Years of marriage", main = "Straight Line Graph")



# -------------------------------------------------------------------------


ggplot(Affairs, aes(x = Affairs$Nb_affairs,
              y = Affairs$yearsmarried)) +
  geom_point() +
  geom_smooth(method = "lm")



# -------------------------------------------------------------------------

#Reading in questions


# -------------------------------------------------------------------------

menCheater <-0
womanCheater <-0

for(i in 1:601){
 if(Affairs$gender[i]=="male" && Affairs$Nb_affairs[i] >= 1){
  
  menCheater<- menCheater + 1
 }
}

print(menCheater)

#####

for(i in 1:601){
  if(Affairs$gender[i]=="female" && Affairs$Nb_affairs[i] >= 1){
    
    menCheater<- menCheater + 1
  }
}

print(menCheater)


# -------------------------------------------------------------------------

tapply(Affairs$Nb_affairs,Affairs$children,mean)

# -------------------------------------------------------------------------







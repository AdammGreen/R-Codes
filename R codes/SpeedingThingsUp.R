

# -------------------------------------------------------------------------
# system time comparison between for loop and apply

M <- matrix(rnorm(1000000), nrow = 1000, ncol = 1000)

system.time(apply(M, 2, sum)) 

sumColumn <- 0

system.time(
  
  for (i in 1:1000) {
  
  sumColumn[i] <- sum(M[,i])
  
  
  })
  print(sumColumn)
  

# -------------------------------------------------------------------------


  #mapply
  
  xs<-replicate(2,runif(10),simplify=FALSE)
  print(xs)
  
  ws<-replicate(2,rpois(10, 5)+1,simplify=FALSE)
  print(ws)
 
  mapply(weighted.mean,xs,ws)
  
  

# -------------------------------------------------------------------------

#database work
  
  library(data.table)
  
  setwd("/Users/adamdanielgreen/Desktop/")
  
  data <- fread("data_1.csv")
  head(data)[1:3, ]
  
  
#new variable added
  
  data<-data[,y:=10*x]
  head(data)

  
#new variable added
  
  data<-data[,new_mean_x:=mean(x),by="pers_id"]
  head(data)
  
  
  
  
 
  
  
  
  
  
  
  
  
  
    



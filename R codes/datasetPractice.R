library(readxl)
library(tidyverse)
library(ggplot2)

b <- read.table("/Users/adamdanielgreen/Desktop/data.csv",sep=";",header = TRUE)

#summary(b)
#glimpse(b)


b$x1 <- str_replace(b$x1,",",".")
b$y1 <- str_replace(b$y1,",",".") #can also use dec = "," when declaring b above


b$x1 <- as.numeric(b$x1)
b$y1 <- as.numeric(b$y1)

b$gen <- factor(b$gen)

#summary(b)

#view(b)


# -------------------------------------------------------------------------

for(i in 1:100) {
  if (b$gen[i] == "F") {
    print(c(b$x1[i], b$y1[i], b$gen[i]))
    
  }
}


# -------------------------------------------------------------------------

#b1<-b[b$gen==F]
#b1




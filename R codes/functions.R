
#calc function

calcFunc <- function(fname,x,y){
  if(fname == "Add"){
    a <- x + y
  }else if(fname=="Subtract"){
    a <- x-y
  }else if(fname=="Divide"){
    a <- x/y
  }else if(fname=="Multiply"){
    a <- x*y
  }
  print(a)
}

calcFunc("Multiply",10,12)


# -------------------------------------------------------------------------
#class example

ft_prod <- function(x, y) {
  z <- x * y
  print(z)
}

ft_prod(10, 2)


# -------------------------------------------------------------------------
#using built in packages and functions

help(package="tseries")


# -------------------------------------------------------------------------

#sqrt of 100 random positive numbers

x <- rnorm(100)

ft_sqrt <- function(x) {
  y <- vector()
  
  for (i in 1:100) {
    if (x[i] > 0) {
      y[i] <- sqrt(x[i])
      
    }
  }
  print(y)
}

ft_sqrt(x)


# -------------------------------------------------------------------------

#function class example 2 with ellipsis argument 

ft_paste <- function(name,age,...){
  
  y <- as.character(paste(" hello my name is ",name,"and i am ",age," years old",...))
  
  
  print(y)
  
}

ft_paste("Adam",22," and im a boss")


# -------------------------------------------------------------------------










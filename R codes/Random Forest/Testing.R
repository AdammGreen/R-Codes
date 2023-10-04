name <- "Adam"
Surname <- "Bossman"

paste(name,Surname)

###################

X <- 1:100
y <- cumsum(X)
head(y)
z<-median(y)
z

h=10
l=20

if(l|h==20){
  print("That is true")
}

player <- "messi"
player2 <- "ronaldo"
player3 <- "mbappe"

y = paste(player,",",player2,"and",player3)


isBetterPlayer <- function(fname){
 if(fname == "Adam Green"){

   print(paste("This player is way better than, ",y))
     }else{
       print("Player is not better")
     }
   }
 
isBetterPlayer("Green")

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

####### Calc function with user entered data
#duo to structure of r this is kinda useless

num1 <- as.numeric(readline(prompt = "Enter the first number:"))

num2 <- as.numeric(readline(prompt = "Enter the second number:"))



calcFunc2 <- function(fname,x,y){
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

calcFunc2("Multiply",num1,num2)



############



repeat_each <- rep(c(1,2,3), each = 3)

repeat_each


###########

# Create a data frame
Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)

# Print the data frame
View(Data_Frame)




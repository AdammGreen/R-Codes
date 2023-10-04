

# -------------------------------------------------------------------------

#Loops

v1 <- c(rnorm(100))

print(v1)


v2<-0 #can also declare as an empty vector v2<-c()
for(i in 1:100){
  v2[i] <- 4+3*v1[i]
}

print(v2)

plot(v1,v2,type = "l", col = "blue", xlab = "v1 on X-axis", ylab = "v2 on Y-axis", main = "Straight Line Graph")



# -------------------------------------------------------------------------

#while loops (same thing)

v1 <- rnorm(100)
v2<- vector()

i<-1
while(i<=100){
  v2[i] <- 4+3*v1[i]
  i<-i+1
}

print(v2)

plot(v1,v2,type = "l", col = "blue", xlab = "v1 on X-axis", ylab = "v2 on Y-axis", main = "Straight Line Graph")



# -------------------------------------------------------------------------

#repeat loop

v1 <- c(rnorm(100))

v2 <- vector()

i <- 1

repeat {
  i <- i + 1
  v2[i] <- 4 + 3 * v1[i]
  
  if (i >= 100) {
    break
  }
}

print(v1)
print(v2)

plot(v1,v2,type = "l", col = "blue", xlab = "v1 on X-axis", ylab = "v2 on Y-axis", main = "Straight Line Graph")



# -------------------------------------------------------------------------

#if statement

vn <- c(rnorm(100))

for (i in 1:100) {
  if (vn[i] > 0) {
    print(vn[i])
    
  }
}


# -------------------------------------------------------------------------

#nested if statement (if else, if else if)


vn <- c(rnorm(100))

for (i in 1:100) {
  if (vn[i] > 0) {
    if (vn[i] < 0.1) {
      print(vn[i])
      
    }
  }
}


# -------------------------------------------------------------------------
#this below is the same as above, but is more efficient

vn <- c(rnorm(100))

for (i in 1:100) {
  if (vn[i] > 0 && vn[i] < 0.1) {
    print(vn[i])
  }
}


# -------------------------------------------------------------------------

vn <- c(rnorm(100))

for (i in 1:100) {
  if (vn[i] > 0) {
    print(vn[i])
  }
  else if(vn[i] < 0.1) {
      print("nothing")
      
    }
  }


# -------------------------------------------------------------------------
#more efficient than above

vn <- c(rnorm(100))

for (i in 1:100) {
  ifelse (vn[i] > 0 && vn[i]<0.1, print(vn[i]), print("nothing"))
}








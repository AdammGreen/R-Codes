#auto format is control shift a
# -------------------------------------------------------------------------

#General Information

x <- rnorm(10000)

Y = as.vector(x)

mean(Y)
sd(Y)
median(Y)
summary(Y)


# -------------------------------------------------------------------------

#Histogram plotting
?hist

hist(
  Y,
  main = "histogram of x",
  xlab = "x",
  ylab = "Frequency",
  prob = TRUE,
  cex.main = 0.5, #set size of name of graphics
  cex.lab = 0.5, #set size of names/labels
  cex.axis = 0.5 #set size of axis
)
lines(density(Y), col = "red")


# -------------------------------------------------------------------------











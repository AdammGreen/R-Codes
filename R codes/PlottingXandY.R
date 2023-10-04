x<-rnorm(10000)
eps<-rnorm(10000)
y<-4-0.5*x+eps
model_3<-lm(y~x)

plot(y,x,type = "l", col = "blue", xlab = "X-axis", ylab = "Y-axis", main = "Straight Line Graph")

plot(x, y, pch = 16, col = "blue", main = "Scatterplot of y vs. x", xlab = "x", ylab = "y")

# Add the regression line to the plot
abline(model_3, col = "red")
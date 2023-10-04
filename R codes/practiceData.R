
library(readxl)
library(tidyverse)
library(ggplot2)

b <- read.table("/Users/adamdanielgreen/Desktop/data.csv",sep=";",header = TRUE)

summary(b)
glimpse(b)


b$x1 <- str_replace(b$x1,",",".")
b$y1 <- str_replace(b$y1,",",".") #can also use dec = "," when declaring b above
 

b$x1 <- as.numeric(b$x1)
b$y1 <- as.numeric(b$y1)

b$gen <- factor(b$gen)

summary(b)

view(b)

# -------------------------------------------------------------------------


# Create a histogram for the 'x1' column
hist(b$x1, main="Histogram of x1",probability = TRUE, xlab="x1 values", ylab="Frequency")
lines(density(b$x1), col = "red")

# Create a histogram for the 'y1' column
hist(b$y1, main="Histogram of y1",probability = TRUE, xlab="y1 values", ylab="Frequency")
lines(density(b$y1), col = "red")


# -------------------------------------------------------------------------

model_1 <- lm(b$x1~b$y1)

plot(model_1)


# -------------------------------------------------------------------------

ggplot(b, aes(x = b$x1,
                y = b$y1)) +
  geom_point() +
  geom_smooth(method = "lm")


# -------------------------------------------------------------------------

?lm

model_2 <- lm(b$x1~b$y1)

summary(model_2)


# -------------------------------------------------------------------------

model_2$coefficients


# -------------------------------------------------------------------------














 
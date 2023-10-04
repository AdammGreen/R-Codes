
v1 <-
  c("Twilight",
    "Smurf Movie",
    "Batman and Robin",
    "Superman",
    "Silence of The Lambs")

v2 <- c(9.8, 7.5, 8, 10, 7.9)
v2 <- as.character(v2)

v3 <- c(v1, v2)

A <- matrix(v3,
            nrow = 2,
            ncol = 5,
            byrow = TRUE)

print(A)


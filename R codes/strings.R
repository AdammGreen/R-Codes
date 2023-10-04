
library(stringr)

string <- "Grand Opening"

split <- strsplit((string)," ")

print(split)


# -------------------------------------------------------------------------

x <- c("R Tutorial","PHP Tutorial", "HTML Tutorial")

y <- gsub("Tutorial","Example",x,ignore.case = T)

print(y)


# -------------------------------------------------------------------------







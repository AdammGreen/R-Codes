#classify patients with heart problems as healthy or unhealthy

library(ggplot2)
library(cowplot)
library(randomForest)

url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"

data <- read.csv(url,header=FALSE)

colnames(data) <- c(
  "age",
  "sex",# 0 = female, 1 = male
  "cp", # chest pain 
  # 1 = typical angina, 
  # 2 = atypical angina, 
  # 3 = non-anginal pain, 
  # 4 = asymptomatic
  "trestbps", # resting blood pressure (in mm Hg)
  "chol", # serum cholestoral in mg/dl
  "fbs",  # fasting blood sugar if less than 120 mg/dl, 1 = TRUE, 0 = FALSE
  "restecg", # resting electrocardiographic results
  # 1 = normal
  # 2 = having ST-T wave abnormality
  # 3 = showing probable or definite left ventricular hypertrophy
  "thalach", # maximum heart rate achieved
  "exang",   # exercise induced angina, 1 = yes, 0 = no
  "oldpeak", # ST depression induced by exercise relative to rest
  "slope", # the slope of the peak exercise ST segment 
  # 1 = upsloping 
  # 2 = flat 
  # 3 = downsloping 
  "ca", # number of major vessels (0-3) colored by fluoroscopy
  "thal", # this is short of thalium heart scan
  # 3 = normal (no cold spots)
  # 6 = fixed defect (cold spots during rest and exercise)
  # 7 = reversible defect (when cold spots only appear during exercise)
  "hd" # (the predicted attribute) - diagnosis of heart disease 
  # 0 if less than or equal to 50% diameter narrowing
  # 1 if greater than 50% diameter narrowing
)

head(data)


# -------------------------------------------------------------------------


data[data=="?"]<-NA

data[data$sex == 0,]$sex <- "F"
data[data$sex == 1,]$sex <- "M"     #one way to covert
data$sex <- as.factor(data$sex)

data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)

data$ca <- as.integer(data$ca)
data$ca <- as.factor(data$ca)

data$thal <- as.integer(data$thal)
data$thal <- as.factor(data$thal)


data$hd <- ifelse(test=data$hd == 0, yes = "Healthy", no = "Unhealthy")
data$hd <- as.factor(data$hd)       #other way to convert

str(data)

# -------------------------------------------------------------------------

#making tree model with 500 tree default

set.seed(42)

data.imputed <- rfImpute(hd ~ ., data = data, iter = 6)

model <- randomForest(hd ~ ., data = data.imputed, proximity = TRUE)

model #83% accurate so lets try make this better


# -------------------------------------------------------------------------

#plotting a dataframe
oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Healthy", "Unhealthy"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"Healthy"], 
          model$err.rate[,"Unhealthy"]))


# -------------------------------------------------------------------------

#graphing it on plot

ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))


# -------------------------------------------------------------------------

#make more accurate

model <- randomForest(hd ~ ., data = data.imputed, ntree = 1000, proximity = TRUE)

model #basically same as before , adding more trees didnt help. Can graph again to see this visually but i didnt do that

#try up accuracy with a vector
oob.values <- vector(length=10)
for(i in 1:10) {
  temp.model <- randomForest(hd ~ ., data=data.imputed, mtry=i, ntree=1000)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1] #access the OOB error rate where all 1000 trees have been made
}
oob.values


# -------------------------------------------------------------------------

#draw an MDS plot
#calcs distance between OOB and the rest

distance.matrix <- as.dist(1-model$proximity)

mds.stuff <- cmdscale(distance.matrix, eig=TRUE, x.ret=TRUE)


mds.var.per <- round(mds.stuff$eig/sum(mds.stuff$eig)*100, 1)


mds.values <- mds.stuff$points
mds.data <- data.frame(Sample=rownames(mds.values),
                       X=mds.values[,1],
                       Y=mds.values[,2],
                       Status=data.imputed$hd)


# -------------------------------------------------------------------------

#actually plotting the graph

ggplot(data=mds.data, aes(x=X, y=Y, label=Sample)) + 
  geom_text(aes(color=Status)) +
  theme_bw() +
  xlab(paste("MDS1 - ", mds.var.per[1], "%", sep="")) +
  ylab(paste("MDS2 - ", mds.var.per[2], "%", sep="")) +
  ggtitle("MDS plot using (1 - Random Forest Proximities)")
# ggsave(file="random_forest_mds_plot.pdf")



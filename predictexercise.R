rm(list=ls())

library(knitr)
library(caret)


mydata <- read.csv("./data/pml-training.csv")
testdata <- read.csv("./data/pml-testing.csv")
summary(mydata)
head(mydata)

inTrain <- createDataPartition(mydata$classe, p=0.7, list= FALSE)
training <- mydata[inTrain,]
testing <- mydata[-inTrain,]
dim(training)
dim(testing)
dim(mydata)





modFitRF <- train(classe~.,data=training,method="rf",prox=TRUE)
getTree(modFitRF$finalModel,k=2)
predRF <- predict(modFitRF,testing)
testing$predRight <- predRF == testing$classe
table(predRF,testing$classe)


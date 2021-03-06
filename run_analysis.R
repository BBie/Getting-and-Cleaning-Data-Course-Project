## You should create one R script called run_analysis.R that does the following. 

## 1. Merges the training and the test sets to create one data set.
install.packages("dplyr")
## select "United States(NC) as CRAN Mirror"
library(dplyr)  
# Attaching package: ‘dplyr’

# The following objects are masked from ‘package:stats’:

#     filter, lag

# The following objects are masked from ‘package:base’:

#     intersect, setdiff, setequal, union

# Warning message:
# package ‘dplyr’ was built under R version 3.2.2 
> getwd()
[1] "C:/Users/Bijie/Documents/R/Getting and Cleaning Data"

## Solutions ##
## Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt” ## 
## values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt" ## 
## Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt” ## 
## Names of Varibles Features come from “features.txt” ## 
## levels of Varible Activity come from “activity_labels.txt” ## 

setwd("C:/Users/Bijie/Documents/R/Getting and Cleaning Data/UCI HAR Dataset/")
activityLabels <- read.table("activity_labels.txt", header = FALSE)
featureNames <- read.table("features.txt", header = FALSE)

## reset wd() ##
setwd("C:/Users/Bijie/Documents/R/Getting and Cleaning Data/UCI HAR Dataset/test") 
list.files(getwd(),pattern=".*.txt")
[1] "subject_test.txt" "X_test.txt"       "y_test.txt"  
## Read test data ##
subjectTest <- read.table("subject_test.txt", header = FALSE)
X_test <- read.table("X_test.txt", header = FALSE)
y_test <- read.table("y_test.txt", header = FALSE)


## reset wd() ##
setwd("C:/Users/Bijie/Documents/R/Getting and Cleaning Data/UCI HAR Dataset/train") 
list.files(getwd(),pattern=".*.txt")
[1] "subject_train.txt" "X_train.txt"       "y_train.txt"   
## Read test data ##
subjectTrain <- read.table("subject_train.txt", header = FALSE)
X_train <- read.table("X_train.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)

## proprety of data sets ##
str(activityLabels)
str(featureNames)
str(subjectTest)
str(subjectTrain)
str(X_test)
str(X_train)
str(y_test)
str(y_train)

### Concatenate the data tables by rows
dataSubject <- rbind(subjectTrain, subjectTest)
dataY<- rbind(y_train, y_test)
dataX<- rbind(X_train, X_test)
### set names to variables
names(dataSubject)<-c("subject")
names(dataY)<- c("activity")
dataXNames <- featureNames
names(dataX)<- dataXNames$V2
### Merge columns to get the data frame Data for all data
dataCombine <- cbind(dataSubject, dataY)
Data <- cbind(dataX, dataCombine)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

sapply(dataSubject, mean, na.rm=TRUE)  
sapply(dataSubject, sd, na.rm=TRUE) 
sapply(dataX, mean, na.rm=TRUE)  
sapply(dataX, sd, na.rm=TRUE)  
sapply(dataY, mean, na.rm=TRUE)  
sapply(dataY, sd, na.rm=TRUE) 


## 3. Uses descriptive activity names to name the activities in the data set

setwd("C:/Users/Bijie/Documents/R/Getting and Cleaning Data/UCI HAR Dataset/")
read.table("activity_labels.txt", header = FALSE)
##   V1                 V2
## 1  1            WALKING
## 2  2   WALKING_UPSTAIRS
## 3  3 WALKING_DOWNSTAIRS
## 4  4            SITTING
## 5  5           STANDING
## 6  6             LAYING

Data$activity[Data$activity==1] <- "WALKING"
Data$activity[Data$activity==2] <- "WALKING_UPSTAIRS"
Data$activity[Data$activity==3] <- "WALKING_DOWNSTAIRS"
Data$activity[Data$activity==4] <- "SITTING"
Data$activity[Data$activity==5] <- "STANDING"
Data$activity[Data$activity==6] <- "LAYING"
### check if the recoding goes well ###
head(Data$activity,30)

## 4. Appropriately labels the data set with descriptive variable names. 

names(Data)

## Solution: rename selected variable names to more descriptive variable names using y<-gsub("\\()","", x) ##

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
## Please upload your data set as a txt file created with write.table() using row.name=FALSE 
## (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

library(plyr)

## create tidyData as a data set with average for each activity and subject: aggregate(x, by, FUN) ## 
## Order the enties in tidyData and write it into data file Tidy.txt that contains the processed data  ##

tidyData<-aggregate(. ~subject + activity, Data, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)
tidyData

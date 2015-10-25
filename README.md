# Getting-and-Cleaning-Data-Course-Project

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Outline of run_analysis.R

Step 1:
1. install "dplyr" first
2. Combine “Y_train.txt” and “Y_test.txt”
3. Combine “subject_train.txt” and subject_test.txt"  
4. Combine “X_train.txt” and “X_test.txt”  
5. Names of Varibles Features come from “features.txt”  
6. levels of Varible Activity come from “activity_labels.txt” 
7. Merge all data into one data frame

Step 2:
Use sapply to extract the mean and standard deviation for each measurement

Step 3:
1. Read the "activity_labels.txt" and see the variables
2. Recode Data$activity, use activity name to replace the numbers
3. Check head(Data$activity) and see if the recoding goes correctly

Step 4:
1. Use names(Data) to see the column names
2. Rename selected variable names to more descriptive variable names using y<-gsub("\\()","", x) 

Step 5:
1. Create tidyData as a data set with average for each activity and subject: aggregate(x, by, FUN) 
2. Order the enties in tidyData and write it into data file Tidy.txt that contains the processed data

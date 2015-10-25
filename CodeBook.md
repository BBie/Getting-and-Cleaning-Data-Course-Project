Data source
The original data comes from the smartphone accelerometer and gyroscope 3-axial raw signals, which have been processed using various signal processing techniques to measurement vector consisting of 561 feature: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
•	features_info.txt: Shows information about the variables used on the feature vector.
•	features.txt: List of all features.
•	activity_labels.txt: Links the class labels with their activity name.
•	train/X_train.txt: Training set.
•	train/y_train.txt: Training labels.
•	test/X_test.txt: Test set.
•	test/y_test.txt: Test labels.
•	train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
•	test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
Variables
The activity labels consist of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
•	tBodyAcc-XYZ
•	tGravityAcc-XYZ
•	tBodyAccJerk-XYZ
•	tBodyGyro-XYZ
•	tBodyGyroJerk-XYZ
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag
•	fBodyAcc-XYZ
•	fBodyAccJerk-XYZ
•	fBodyGyro-XYZ
•	fBodyAccMag
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag

Transformations
Training and test data set rows were appended and then a unified data set created from the source files.
Measurements were extracted for mean, standard deviation for each measurement.
Tidy data set contains the average of all feature standard deviation and mean values of the raw dataset. Original variable names were modified in the following way:
1.	Replaced prefix “t” with time
2.	Replaced prefix “t” with frequency
3.	Replaced Acc with Accelerometer
4.	Replaced Gyro with Gyroscope
5.	Replaced Mag with Magnitude
6.	Replaced BodyBody with Body
Results were output as an indepenent tidy data set “tidydata.txt”















In order to execute the run_analysis.R script, it is needed to prepare the data and follow the steps bellow.

1-  Download the needed data

	+ filename <- "Data.zip"
	+ fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  	+ download.file(fileURL, filename, method="curl")
  	+ unzip(filename)

 2- Assign data to variable:
 	* features <- features.txt
 	  Those features are comming from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
 	  
 	* activities <- test/activity_labels.txt
 	  Represent the activities executed when the corresponding measurements were taken and its codes 
 	  
 	* subject_test <- test/subject_test.txt
 	  contains test data observed during the tests performed with volunteers

 	 * x_test <- test/X_test.txt
 	   data comming from features test data
	   
	 * y_test <- y_test.txt : 2947 rows, 1 columns
	   represents the test data concerning activities’code labels

	 * subject_train <- test/subject_train.txt : 7352 rows, 1 column
	   represents train data of volunteer subjects being observed

	 * x_train <- test/X_train.txt : 7352 rows, 561 columns
	   represents train data for features

	 * y_train <- test/y_train.txt : 7352 rows, 1 columns
	   represents rain data of activities’code labels

 3- Create a unique set of data by merging test and train data
 
	Use rbind function to create x 
	Use rbind function to create y
	Merge subject_train and subject_test using rbind()
	Create Merged_Data by mergingSubject, Y and X using cbind function

 4-  Extracts only the measurements on the mean and standard deviation for each measurement
 
	Create TidySelectedData - for each measurement, Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std)
	
 5- Uses descriptive activity names to name the activities in the data set
 
    Use corresponding activity taken from activities variable to replace the code column on TidySelectedData

 6- Appropriately labels the data set with descriptive variable names
 
	Replace Acc in column’s name by Accelerometer
	Replace Gyro in column’s name by Gyroscope
	Replace BodyBody in column’s name by Body
	Replace Mag in column’s name by Magnitude
	Replace start with character f in column’s name by Frequency
	Replace start with character t in column’s name by Time

 7- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
 
    * From summarizing TidySelectedData, exgracting the means of each variable (for each activity and each subject) after groupped by subject and activity 



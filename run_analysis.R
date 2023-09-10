features <- read.table("./features.txt", col.names = c("n","functions"))
activities <- read.table("./activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features$functions)
y_test <- read.table("./test/y_test.txt", col.names = "code")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt", col.names = features$functions)
y_train <- read.table("./train/y_train.txt", col.names = "code")


x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged <- cbind(Subject, y, x)

TidySelectedData <- Merged %>% select(subject, code, contains("mean"), contains("std"))

TidySelectedData$code <- activities[TidySelectedData$code, 2]

names(TidySelectedData)[2] = "activity"
names(TidySelectedData) <- gsub("Acc", "Accelerometer", names(TidySelectedData))
names(TidySelectedData)<-gsub("Gyro", "Gyroscope", names(TidySelectedData))
names(TidySelectedData)<-gsub("BodyBody", "Body", names(TidySelectedData))
names(TidySelectedData)<-gsub("Mag", "Magnitude", names(TidySelectedData))
names(TidySelectedData)<-gsub("^t", "Time", names(TidySelectedData))
names(TidySelectedData)<-gsub("^f", "Frequency", names(TidySelectedData))
names(TidySelectedData)<-gsub("tBody", "TimeBody", names(TidySelectedData))
names(TidySelectedData)<-gsub("-mean()", "Mean", names(TidySelectedData), ignore.case = TRUE)
names(TidySelectedData)<-gsub("-std()", "STD", names(TidySelectedData), ignore.case = TRUE)
names(TidySelectedData)<-gsub("-freq()", "Frequency", names(TidySelectedData), ignore.case = TRUE)
names(TidySelectedData)<-gsub("angle", "Angle", names(TidySelectedData))
names(TidySelectedData)<-gsub("gravity", "Gravity", names(TidySelectedData))

SecondTidyData <- TidySelectedData %>% group_by(subject, activity) %>% summarise_all(list(mean))
write.table(SecondTidyData, "SecondTidyData.txt", row.name = FALSE)

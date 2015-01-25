runAnalysis <- function() {

	# part 1: Merges the training and the test sets to create one data set.
	
	subjecttrain <- read.table("subject_train.txt")
	xtrain <- read.table("X_train.txt")
	ytrain <- read.table("y_train.txt")
	subjecttest <- read.table("subject_test.txt")
	xtest <- read.table("X_test.txt")
	ytest <- read.table("y_test.txt")
	test <- cbind(subjecttest, ytest, xtest)
	train <- cbind(subjecttrain, ytrain, xtrain)
	mdata <- rbind(test, train)
	
	
	## Part 4: Appropriately labels the data set with descriptive variable names.
	## Variable names are from the "features.txt"
	
	features<- read.table("features.txt")
	listofCNames <- make.names(features[,2],unique=TRUE)
	colnames(mdata) <- c("Subject", "Activity", listofCNames)
	
	
	## Part 2: "tBodyAcc-XYZ", "tGravityAcc-XYZ", and "tBodyGyro-XYZ" are the parameters obtained by measurement; the others were obtained by computing measured data.
	## Extracts only the measurements on the mean and standard deviation for each measurement. The new data frame is named "mdata2".
	## Bind with "Subject" and "Activity" column, the data set is named "msData"
	
	mdata2 <- mdata[,(grepl("mean", colnames(mdata)) | grepl("std", colnames(mdata)) )]
	mdata2 <- mdata2[,(grepl("tBodyAcc", colnames(mdata2)) | grepl("tGravityAcc", colnames(mdata2)) | grepl("tBodyGyro", colnames(mdata2)))]
	library(dplyr)
	mdata2 <- select(mdata2, -contains("jerk"))
	mdata2 <- select(mdata2, -contains("Mag"))
	msData <- cbind(mdata[,1:2], mdata2)
		
	
	## Part 3: Uses descriptive activity names to name the activities in the data set "msData"
	
	activityLabels <- read.table("activity_labels.txt")
	msData[,2] <- activityLabels[msData[,2], 2]
	
	
	## Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	bySubAct <- msData %>% group_by(Subject, Activity)
	df <- bySubAct %>% summarise_each(funs(mean))
	write.table(df, file = "step5tidydata.txt", sep = " ", row.name=FALSE)
	
}

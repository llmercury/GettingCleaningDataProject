# GettingCleaningDataProject
Course project of Coursera "Getting and Cleaning Data"

The purpose of this project is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The documents submitted: 1) a tidy data set as described below, 2) a link to a Github repository with my script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md. I also include a README.md in the repo . It explains how the script work.  

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R script I created is called run_analysis.R that does the following: 
* Read "subject_train.txt", "y_train.txt", "X_train.txt", "subject_test.txt", "y_test.txt", "X_test.txt". Column bind the first three files called "train.txt". Column bind the last three files called "test.txt". Row binded the newly created two files into one data set "mdata". This data set has 10299 rows and 563 columns.
* Labels the data set with descriptive variable names. The variable names are from the 2nd column of the "features.txt". The values of the 2nd column of the "features.txt" is converted to valid column names, meaning that "_" and "()" were removed. This is the step 4 in the project description. I choose to do this before the 2nd step because after the descriptive variable names help to select the columns by names. 
* Extracts only the measurements on the mean and standard deviation for each measurement. The codeBook.md file explained how those variables were selected. The data set was named "msData". msData has 10299 rows and 20 columns.
* Uses descriptive activity names (from "activity_labels.txt") to name the activities (2nd column of "msData" ) in the data set.
* From the data set in step 4, by using group_by and summarise_each, create a tidy data set with the average of each variable for each activity and each subject. The data set was named "df". "df" has 180 rows and 20 columns. "df" is written to a text file named "step5tidyData.txt" in the working directory. 

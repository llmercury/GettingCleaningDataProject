# Code Book for the Tidy Data Set Obtained on Step 5
________________________________________________________________________________________________________________________________
## Data Source

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Feature Selection
From the "features_info.txt" of the original data, the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Therefore, tGyro-XYZ, tBodyAcc-XYZ, and tGravityAcc-XYZ are measurements.

the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). All the parameters whose names contain "Mag" meaning magnitude of signals were calculated from measurement results. All the parameters starting with "f" are also calculations by Fast Fourier Transform (FFT) of the time domain signals.

Therefore, the measurements on the mean and standard deviation I extracted on step 2 have 18 variables:

- tBodyAcc.mean...X
- tBodyAcc.mean...Y
- tBodyAcc.mean...Z
- tBodyAcc.std...X   
- tBodyAcc.std...Y
- tBodyAcc.std...Z
- tGravityAcc.mean...X
- tGravityAcc.mean...Y
- tGravityAcc.mean...Z
- tGravityAcc.std...X 
- tGravityAcc.std...Y
- tGravityAcc.std...Z
- tBodyGyro.mean...X
- tBodyGyro.mean...Y
- tBodyGyro.mean...Z
- tBodyGyro.std...X   
- tBodyGyro.std...Y
- tBodyGyro.std...Z

The data set after step 4 includes those 18 variables as well as "Subject" and "Activity" as the 1st and 2nd columns.

On step 5, A tidy data set was obtained by average each of those 18 variables for each activity and each subject. The names of the variables in the tidy data set were maintained.


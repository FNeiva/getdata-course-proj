# Getting and Cleaning Data Course Project
======
## Coursera Data Science Track
## CodeBook For Run_Analysis.R Output

### Variables explanation 
=================

The variables resulting from the run_analysis.R script come from manipulating the original data set from the "UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set" available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set"). From the codebook from the original data set, "the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

The run_analysis.R script then filters only the mean and standard deviation of all variables, and calculates their average for each subject and activity group.

The original data set contains the following signals. Signals containing "XYZ" were split into three different signals each for X, Y, and Z axis:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Each signal, for each axis, are presented as the following variables:

mean: Mean value
std: Standard deviation

The signals beginning with an 'f' in their name also have an additional variable:

meanFreq: Weighted average of the frequency components to obtain a mean frequency

And lastly the following vectors obtained by averaging the signals in a signal window sample:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

This results in 79 variables which are then summarised as an average by group of subject and activity, composing the resulting data set.

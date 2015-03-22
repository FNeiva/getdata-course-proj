# Getting and Cleaning Data Course Project
======
## Coursera Data Science Track
## README File

### Introduction

This README file explains how to use the script and it's inner workings.

The purpose of the run_analysis.R script is to read the files produced by subjects wearing a smartphone on the waist while performing activities, as detailed on the data set's website available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set"), and perform a series of transformations in order to produce a tidier, analisable data set. The data set's website provides more information on how the data was obtained.

Along with this README file, the CodeBook.md file provides more information on the variables in the output tidy data set.

======

### Pre-requisites

This script uses the **dplyr** package to group by and summarise data in the last step of it's execution. It will try to load this library when sourced.

======

### Script Usage

To use the run_analysis.R script, simply source it in your R environment, switch your R Working Directory to the directory containing all the decompressed data set files in their original structure and
run the run_analysis() function to produce the tidy data set. The following is an example command-by-command tutorial on how to use the script:

```r
source('~/run_analysis.R') # Source the script
setwd("~/UCI HAR Dataset") # Change the working directory
tidydf <- run_analysis() # Run the analysis and store the output data frame into tidydf
write.table(tidydf,"~/tidy.txt", row.names = FALSE) # Writes the output data frame to a file on disk
```

======

### Script Inner Workings and Transformation

Initially, the script reads all six files containing the data from the experiment. Those files are: X_test.txt, containing the experiment data itself from the test group, y_test.txt, containing the activity codes for each row of X_test.txt and subject_test.txt for the subject related to each row of X_test.txt. Those files are read into the variables *xtest*, *ytest* and *subject_test* respectivelly. We then bind all three variables into the same data frame, putting the subject_test data into the first column, activity data into the second column and the rest of the data, containing the values and variables, into the other columns. The resulting data frame is called *testdf*. Then, the script reads the equivalent three files for the train data into the variables *xtrain*, *ytrain* and *subject_train* variables and perform the same procedure, storing the resulting data frame into the *traindf* variable. Finally, all data is merged together by binding the rows from the test and train data frames into a single data frame called *data*.

Next, we read the features.txt file containing the variable names into the *features* data frame. We then filter this data frame for only the variables containing "median" ou "standard deviation" values. Since we added two columns to the original data frame containing the data, we then shift the indexes of the variables in the features data frame by two so they still relate to the original data, and then add two additional rows, in the beginning of the data frame, related to the subject and activity variables. Finally, we use the indexes in this data frame to filter the columns we desire in the *data* data frame, which contains all the experiment data merged together.

The third step is reading the activity_labels.txt file, containing the labels related to the activities in the data, into the *actlabels* data frame. Then, we substitute all values in the *activity* column of the *data* data frame by the activity name by looking up the *actlabels* data frame.

The next step is using the *variable* column from the *features* data frame as input to rename the variables in the *data* data frame, so as to have named columns. The last step is copying the *data* data frame to a new data frame called *tidydf*, which will contain the tidy data, and then resume all data by using the **dplyr** package to group the *tidydf* data frame by subject and activity and then summarise all variables in the other columns by their average value. 




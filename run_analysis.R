# Data Science Specialization
# Getting and Cleaning Data
# Course Project

# This script should do the following to the smartphone accelerometer data:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

# This script assumes all files are using their default names and that the working directory is the
# root of the directory inside the uncompressed data file from the project page

run_analysis <- function () {
  # First, read the test files
  xtest <- read.table("test/X_test.txt")
  ytest <- read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")
  
  # Merge the subject and activity (y) variables into a single test data frame with test data
  testdf <- cbind(subject_test,ytest,xtest)
  
  # Now read the train files
  xtrain <- read.table("train/X_train.txt")
  ytrain <- read.table("train/y_train.txt")
  subject_train <- read.table("train/subject_train.txt")
  
  # STEP 1
  # Merge the subject and activity (y) variables into a single train data frame with train data
  traindf <- cbind(subject_train,ytrain,xtrain)
  
  # Finally, we merge both test and train data into a single data frame
  data <- rbind(testdf,traindf)
  
  # STEP 2
  # Now we proceed to removing the columns that do not have mean or standard deviation data
  # Read the features to get variable names
  features <- read.table("features.txt", stringsAsFactors=FALSE)
  colnames(features) <- c("index","variable")
  
  # Now filter the list with the indexes of the columns we want, by searching for the pattern "mean"
  # or "std" in the feature name
  features <- features[grepl("mean", features$variable) | grepl("std", features$variable),]
    
  # Since we have added two columns (subject and activity) before the test data table, the columns
  # have shifted by two, so we shift the indexes by two as well.
  features$index <- sapply(features$index, function(x) x <- x+2)
    
  # And include the first two columns
  features <- rbind(list(1,"subject"),list(2,"activity"),features)
  
  # Now we filter the columns of our data frame
  data <- data[,features$index]
    
  # STEP 3
  # Read the activity labels from the input file
  
  actlabels <- read.table("activity_labels.txt")
  colnames(actlabels) <- c("index","activity")
    
  # Now we replace the activity ID by the name on our main data frame, by looping through the column
  # containing the activity codes and replacing it with the label from the activity labels data frame
  data$V1.1 <- sapply(data$V1.1,function (x) x <- as.character(actlabels[actlabels$index == x,]$activity))
      
  # STEP 4
  # We should now rename the variables in our main data frame with the variable names from our features
  # data frame
    
  colnames(data) = features$variable
  
  # STEP 5
  # Now we copy our data fame to the one to be summarized
  
  tidydf <- data
    
  # Group the data frame by subject and activity and take the mean of each variable for every 
  # subject-activity pair.
    
  tidydf <- tidydf %>% group_by(subject,activity) %>% summarise_each(funs(mean))

  return(tidydf)
  
}

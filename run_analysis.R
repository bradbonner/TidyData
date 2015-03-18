
###############################################################################
# You should create one R script called run_analysis.R that does the following. 
# 1 - Merges the training and the test sets to create one data set.
#
# 2 - Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
#
# 4 - Appropriately labels the data set with descriptive variable names. 
#
# 5 - From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.
#
#     ---- summarize(grouped_ds, total=sum(col1), unique=n_distinct(col2))
#
###############################################################################

# read all files in
# put the files together
# put the column names in
# put the activity values in
# give good names to columns


###############################################################################
# This is for testing 
# Remove all objects before running
print("Removing objects from memory")
rm(list=ls())
###############################################################################

library("data.table")
library("dplyr")
library("tidyr")

# ATTENTION: figure out a way to read in a subset
# This function takes the directory, filename and column vector
# and returns a data frame containing the files data
getTable <- function(dir, filename, columns) {
  fullpath <- paste(dir, filename, sep = "")
  #print(paste("Reading data from", fullpath))
  DT <- read.table(fullpath, col.names = columns)
  DT <- tbl_df(DT)
  DT
}

###############################################################################
#### Download and unzip the data 
###############################################################################





###############################################################################
#### Define the directories and variables
###############################################################################
print("Defining the directories")
dataDir <- "./data/UCI HAR Dataset"
testDataDir <- "./data/UCI HAR Dataset/test"
trainDataDir <- "./data/UCI HAR Dataset/train"

###############################################################################
#### Get the original data sets as data frames
###############################################################################

# Activities
print("Getting the Activities Table")
activityDT <- getTable(dataDir, "/activity_labels.txt", c("ActivityID", "ActivityName"))

# Features ( will be the column names for the test and training data)
print("Getting the Features Table")
featuresDT <- getTable(dataDir, "/features.txt", c("FeatureID", "FeatureName"))
featureColumns <- featuresDT[["FeatureName"]]



# Test Data 
print("Getting the Test Subject Table")
subjectTestDT <- getTable(testDataDir, "/subject_test.txt", c("SubjectID"))
print("Getting the Test Data Table")
testDataDT <- getTable(testDataDir, "/X_test.txt", featureColumns)
print("Getting the Test Label Table")
testLabelDT <- getTable(testDataDir, "/y_test.txt", c("ActivityID"))

# Get the ActivityNames for the ActivityIDs
print("Merging to get Activity Names for Test Data")
testDT <- merge(testLabelDT, activityDT)
testDT <- tbl_df(testDT)

# testDataDT and testDT should each be 2947 rows
print("Binding the columns for test data and activities")
testDataSet <- cbind(subjectTestDT, testDataDT, testDT)
testDataSet <- tbl_df(testDataSet)



# Train Data 
print("Getting the Train Subject Table")
subjectTrainDT <- getTable(trainDataDir, "/subject_train.txt", c("SubjectID"))
print("Getting the Train Data Table")
trainDataDT <- getTable(trainDataDir, "/X_train.txt", featureColumns)
print("Getting the Train Label Table")
trainLabelDT <- getTable(trainDataDir, "/y_train.txt", c("ActivityID"))

# Get the ActivityNames for the ActivityIDs
print("Merging to get Activity Names for Train Data")
trainDT <- merge(trainLabelDT, activityDT)
trainDT <- tbl_df(trainDT)

# trainDataDT and trainDT should each be 7352 rows
print("Binding the columns for train data and activities")
trainDataSet <- cbind(subjectTrainDT, trainDataDT, trainDT)
trainDataSet <- tbl_df(trainDataSet)


###############################################################################
#### Combine the data sets into one large data frame
###############################################################################

print("Binding the Train and Test Datasets")
completeDataSet <- rbind(trainDataSet, testDataSet)


###############################################################################
#### Remove all columns except means and stds
###############################################################################



###############################################################################
#### Create the summarized data set
###############################################################################



###############################################################################
#### Write the data to files
###############################################################################



print("Complete.")













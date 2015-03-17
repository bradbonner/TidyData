
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
###############################################################################

# read all files in
# put the files together
# put the column names in
# put the activity values in
# give good names to columns

library("data.table")
library("dplyr")
library("tidyr")


# Download the data and prep the directories

dataDir <- "./data/UCI HAR Dataset"
testDataDir <- "./data/UCI HAR Dataset/test"
trainDataDir <- "./data/UCI HAR Dataset/train"


activityFileName <- paste(dataDir, "/activity_labels.txt", sep="")
activityDT <- read.table(activityFileName, col.names = c("ActivityID", "ActivityName"))
activityDT <- tbl_df(activityDT)

# Features will be the column names for the test and training data
featuresFileName <- paste(dataDir, "/features.txt", sep="")
featuresDT <- read.table(featuresFileName, col.names = c("FeatureID", "FeatureName"))
featuresDT <- tbl_df(featuresDT)

featureColumns <- featuresDT[["FeatureName"]]



# Test Data Set

subjectColumns  <- c("SubjectID")

subjectTestFileName <- paste(testDataDir, "/subject_test.txt", sep="")
subjectTestDT <- read.table(subjectTestFileName, col.names = subjectColumns)
subjectTestDT <- tbl_df(subjectTestDT)

testSetFileName <- paste(testDataDir, "/X_test.txt", sep="")
testDT <- read.table(testSetFileName, col.names = featureColumns)
testDT <- tbl_df(testDT)


















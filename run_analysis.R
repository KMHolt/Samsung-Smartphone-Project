# Clear environment
rm(list = ls())

# Install package and Load the library needed for some of the functions
if (!require(dplyr)) {
     install.packages("dplyr")
     library(dplyr)
}

# Create directory to hold downloaded data
if (!file.exists("./data")) 
{dir.create("./data")}

# Set directory variables
dirMain <- getwd()
path <- file.path(dirMain, "data")

# Download zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "./Dataset.zip",
              overwrite = T)

# Unzip file into data directory
unzip(zipfile = "./Dataset.zip", exdir = "./data")

# Read activities data
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",
                             col.names = c("index", "activityName"))

# Read features data
features <- read.table("./data/UCI HAR Dataset/features.txt",
                       col.names = c("index", "featureName"))

# Read all training data
trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",
                            col.names = c("subject"))

trainLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt",
                          col.names = c("activity"))

trainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt",
                        col.names = features$featureName)

# Read all testing data
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",
                           col.names = c("subject"))

testLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt",
                         col.names = c("activity"))

testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt",
                       col.names = features$featureName)

# Combine all training tables into one
newTrain <- cbind(trainSubjects, trainLabels, trainData)

# Add column to identify the table
newTrain$type <- "Train"

# Combine all test tables into one
newTest <- cbind(testSubjects, testLabels, testData)

# Add column to identify the table
newTest$type <- "Test"

# Combine test and training into one table
combined <- rbind(newTest, newTrain)

# Change the activity to a name of an activity
combined$activity <- activityLabels[match(combined$activity, activityLabels$index),2]

# Subset the mean and std data from the combined table
finalTable <- combined %>% select(subject, activity, type, contains("mean"), contains("std"), -(contains("meanFreq")))

# Change column names to be more descriptive
names(finalTable) <- gsub("^t", "Time", names(finalTable))

names(finalTable) <- gsub("tBody", "TimeBody", names(finalTable))

names(finalTable) <- gsub("^f", "Frequency", names(finalTable))

names(finalTable) <- gsub("Acc", "Accelerometer", names(finalTable))

names(finalTable) <- gsub("Gyro", "Gyroscope", names(finalTable))

names(finalTable) <- gsub("Mag", "Magnitude", names(finalTable))

names(finalTable) <- gsub("std", "StandardDeviation", names(finalTable))

names(finalTable) <- gsub("mean", "Mean", names(finalTable))

# Created summarized table
summaryData <- finalTable %>%
     group_by(subject, activity) %>%
     summarise_if(is.numeric, mean, na.rm = FALSE)

# Send data to a file
write.csv(summaryData, file = "Summarized Data")

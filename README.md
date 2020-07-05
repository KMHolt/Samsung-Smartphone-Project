# Getting and Cleaning Data Course Project


The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The original source data comes from [Human Activity Recognition Using Smartphones source information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The source data used comes from [Data for Project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

There is one script use to produce the final file summaryData.  The script will:

1. Download the zip file from the site into a newly created directory (if it does not already exist).
1. Each file is imported into a new data table and given appropriate column names.
1. The data is then combined into one table with identifiers for the subject, activity,type of experiment and clear column names based on the specific feature.
1. A summarized dataset is created with the means of all columns and grouped by subject and activity.
1. A text file is generated from the final dataset. 


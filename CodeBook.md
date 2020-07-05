---
title: "Codebook for summaryData"
subtitle: Human Activity Recognition Using Smartphones Data Set
author: "Kasha Holt"
date: "7/5/2020"
output: html_document
---

## Data Source

### Authors
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)  
1 - Smartlab - Non-Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.   
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living  
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain  
activityrecognition '@' smartlab.ws  
[Human Activity Recognition Using Smartphones source information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

An updated version of this dataset can be found at [Web Link]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.  
[Data for Project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Transformation
The following steps were taken in order to produce the final dataset from the original data list above.    

1. The environment was cleared and the dplyr package was loaded.
1. A subdirectory was created to house the data if it did not already exist.
1. Directory variables were set, to be used later in the script.
1. The zip file was downloaded from the site listed above.
1. The file was unzipped into the new subdirectory.
1. The data from the following files were processed into tables:
    1. Activity_Labels.txt = Containes the names of the activities each subject performed during the expiriment. Processed into activityLabels and the column names set to index & activityName.  
    1. features.txt = Contains the names of all of the features with tiem and frequency domain variables.  Processed into features and the column names set to index and featureName.  
    1. subject_train.txt = Contains the identifier for the subject who performed the activity for each window sample in train. Processed into trainSubjects and column name set to subject.  
    1. y_train.txt = Contains the lables for each measure.  Processed into trainLabels and the column name set to activity.  
    1. X_train.txt = Contains the test set for those subjects in the train portion in the experiment.  Process into trainData and the column names were set to those from the features table.  
    1. subject_test.txt = Contains the identifier for the subject who performed the activity for each window sample in test.  Processed into testSubjects and column name set to subject.  
    1. y_test.txt = Contains the lables for each measure. Processed into testLabels and the column name set to activity.
    1. X_test.txt = Contains the test set for those subjects in the test portion in the experiment.  Process into testData and the column names were set to those from the features table.
1. The three train tables were combined into newTrain.
1. The three test tables were combined into newTest.
1. A new column was added to newTrain that identifies the experiment type as Train.
1. A new column was added to newTest that identifies the experiment type as Test.
1. The newTrain and newTest tables were merged into the combined table.
1. The values in the activity column were changed from numbers to actual names of the corresponding activity.
1. A new dataset called finalTable was created from the combined table with only the values where the feature has mean or std in the name.  It excluded any where the feature contained meanFreq, as it was interpreted to not be needed in the test.
1. Each of the abbreviations in the column names were changed so that they were spelled out.
1. A summarized dataset called summaryData was created with the means of all columns and grouped by subject and activity.
1. A text file was created with the summarized data from summaryData.  


# Data report overview
The summaryData dataset has the following dimensions:

---------------------------------
Feature                    Result
------------------------ --------
Number of observations        180

Number of variables            75
---------------------------------


# summaryData table

------------------------------------------------------------------------------------------------------------------------------
Variable                                                                Class       # unique  Missing  Description  
                                                                                                values                        
----------------------------------------------------------------------- ----------- -------- --------- -------------
**[subject]**                                                           integer           30  0.00 %   Identifier for subject            

**[activity]**                                                          character          6  0.00 %   Description of activity             

**[TimeBodyAccelerometer.Mean...X]**                                    numeric          180  0.00 %   Mean of time of body Accelerometer in direction X             

**[TimeBodyAccelerometer.Mean...Y]**                                    numeric          180  0.00 %   Mean of time of body Accelerometer in direction Y             

**[TimeBodyAccelerometer.Mean...Z]**                                    numeric          180  0.00 %   Mean of time of body Accelerometer in direction Z             

**[TimeGravityAccelerometer.Mean...X]**                                 numeric          180  0.00 %   Mean of time gravity Accelerometer in direction X             

**[TimeGravityAccelerometer.Mean...Y]**                                 numeric          180  0.00 %   Mean of time gravity Accelerometer in direction Y             

**[TimeGravityAccelerometer.Mean...Z]**                                 numeric          180  0.00 %   Mean of time gravity Accelerometer in direction Z             

**[TimeBodyAccelerometerJerk.Mean...X]**                                numeric          180  0.00 %   Mean of time body  Accelerometer Jerk in direction X             

**[TimeBodyAccelerometerJerk.Mean...Y]**                                numeric          180  0.00 %   Mean of time body  Accelerometer Jerk in direction Y             

**[TimeBodyAccelerometerJerk.Mean...Z]**                                numeric          180  0.00 %   Mean of time body  Accelerometer Jerk in direction Z             

**[TimeBodyGyroscope.Mean...X]**                                        numeric          180  0.00 %   Mean of time body Gyroscope in direction X             

**[TimeBodyGyroscope.Mean...Y]**                                        numeric          180  0.00 %   Mean of time body Gyroscope in direction Y            

**[TimeBodyGyroscope.Mean...Z]**                                        numeric          180  0.00 %   Mean of time body Gyroscope in direction Z             

**[TimeBodyGyroscopeJerk.Mean...X]**                                    numeric          180  0.00 %   Mean of time body Gyroscope Jerk in direction X             

**[TimeBodyGyroscopeJerk.Mean...Y]**                                    numeric          180  0.00 %   Mean of time body Gyroscope Jerk in direction Y             

**[TimeBodyGyroscopeJerk.Mean...Z]**                                    numeric          180  0.00 %   Mean of time body Gyroscope Jerk in direction Z             

**[TimeBodyAccelerometerMagnitude.Mean..]**                             numeric          180  0.00 %   Mean of time body Accelerometer Magnitude in direction X             

**[TimeGravityAccelerometerMagnitude.Mean..]**                          numeric          180  0.00 %   Mean of time body Accelerometer Magnitude in direction Y             

**[TimeBodyAccelerometerJerkMagnitude.Mean..]**                         numeric          180  0.00 %   Mean of time body Accelerometer Magnitude in direction Z              

**[TimeBodyGyroscopeMagnitude.Mean..]**                                 numeric          180  0.00 %   Mean of time body Gyroscope Magnitude             

**[TimeBodyGyroscopeJerkMagnitude.Mean..]**                             numeric          180  0.00 %   Mean of time body Gyroscope Magnitude            

**[FrequencyBodyAccelerometer.Mean...X]**                               numeric          180  0.00 %   Mean of frequency body Accelerometer in direction X              

**[FrequencyBodyAccelerometer.Mean...Y]**                               numeric          180  0.00 %   Mean of frequency body Accelerometerin direction X              

**[FrequencyBodyAccelerometer.Mean...Z]**                               numeric          180  0.00 %   Mean of frequency body Accelerometer in direction X              

**[FrequencyBodyAccelerometerJerk.Mean...X]**                           numeric          180  0.00 %   Mean of frequency body Accelerometer Jerk in direction X             

**[FrequencyBodyAccelerometerJerk.Mean...Y]**                           numeric          180  0.00 %   Mean of frequency body Accelerometer Jerk in direction Y             

**[FrequencyBodyAccelerometerJerk.Mean...Z]**                           numeric          180  0.00 %   Mean of frequency body Accelerometer Jerk in direction Z              

**[FrequencyBodyGyroscope.Mean...X]**                                   numeric          180  0.00 %   Mean of frequency body Gyroscope in direction X              

**[FrequencyBodyGyroscope.Mean...Y]**                                   numeric          180  0.00 %   Mean of frequency body Gyroscope in direction Y             

**[FrequencyBodyGyroscope.Mean...Z]**                                   numeric          180  0.00 %   Mean of frequency body Gyroscope in direction Z             

**[FrequencyBodyAccelerometerMagnitude.Mean..]**                        numeric          180  0.00 %   Mean of frequency body Accelerometer Magnitude             

**[FrequencyBodyBodyAccelerometerJerkMagnitude.Mean..]**                numeric          180  0.00 %   Mean of frequency body Accelerometer Jerk Magnitude            

**[FrequencyBodyBodyGyroscopeMagnitude.Mean..]**                        numeric          180  0.00 %   Mean of frequency body Gyroscope Magnitude           

**[FrequencyBodyBodyGyroscopeJerkMagnitude.Mean..]**                    numeric          180  0.00 %   Mean of frequency body Gyroscope Jerk Magnitute           

**[angle.TimeBodyAccelerometerMean.gravity.]**                          numeric          180  0.00 %   Mean of angle for time body Accelerometer and gravity            

**[angle.TimeBodyAccelerometerJerkMean..gravityMean.]**                 numeric          180  0.00 %   Mean of angle for time body Accelerometer Jerk and gravity             

**[angle.TimeBodyGyroscopeMean.gravityMean.]**                          numeric          180  0.00 %   Mean of angle for time body Gyroscope gravity             

**[angle.TimeBodyGyroscopeJerkMean.gravityMean.]**                      numeric          180  0.00 %   Mean of angle for time body Gyroscope Jerk and gravity             

**[angle.X.gravityMean.]**                                              numeric          180  0.00 %   Mean of angle gravity  for direction X          

**[angle.Y.gravityMean.]**                                              numeric          180  0.00 %   Mean of angle gravity for direction Y             

**[angle.Z.gravityMean.]**                                              numeric          180  0.00 %   Mean of angle gravity for direction Z              

**[TimeBodyAccelerometer.StandardDeviation...X]**                       numeric          180  0.00 %   Standard deviation of time body Accelerometer in direction X            

**[TimeBodyAccelerometer.StandardDeviation...Y]**                       numeric          180  0.00 %   Standard deviation of time body Accelerometer in direction Y             

**[TimeBodyAccelerometer.StandardDeviation...Z]**                       numeric          180  0.00 %   Standard deviation of time body Accelerometer in direction Z              

**[TimeGravityAccelerometer.StandardDeviation...X]**                    numeric          180  0.00 %   Standard deviation of time gravity Accelerometer in direction X             

**[TimeGravityAccelerometer.StandardDeviation...Y]**                    numeric          180  0.00 %   Standard deviation of time gravity Accelerometer in direction Y             

**[TimeGravityAccelerometer.StandardDeviation...Z]**                    numeric          180  0.00 %   Standard deviation of time gravity Accelerometer in direction Z             

**[TimeBodyAccelerometerJerk.StandardDeviation...X]**                   numeric          180  0.00 %   Standard deviation of time body Accelerometer Jerk in direction X             

**[TimeBodyAccelerometerJerk.StandardDeviation...Y]**                   numeric          180  0.00 %   Standard deviation of time body Accelerometer Jerk in direction Y             

**[TimeBodyAccelerometerJerk.StandardDeviation...Z]**                   numeric          180  0.00 %   Standard deviation of time body Accelerometer Jerk in direction Z             

**[TimeBodyGyroscope.StandardDeviation...X]**                           numeric          180  0.00 %   Standard deviation of time Body Gyroscope in direction X             

**[TimeBodyGyroscope.StandardDeviation...Y]**                           numeric          180  0.00 %   Standard deviation of time gravity Accelerometer in direction Y             

**[TimeBodyGyroscope.StandardDeviation...Z]**                           numeric          180  0.00 %   Standard deviation of time Body Gyroscope in direction Z             

**[TimeBodyGyroscopeJerk.StandardDeviation...X]**                       numeric          180  0.00 %   Standard deviation of time Body Gyroscope Jerk in direction X             

**[TimeBodyGyroscopeJerk.StandardDeviation...Y]**                       numeric          180  0.00 %   Standard deviation of time Body Gyroscope Jerk in direction Y            

**[TimeBodyGyroscopeJerk.StandardDeviation...Z]**                       numeric          180  0.00 %   Standard deviation of time Body Gyroscope Jerk in direction Z             

**[TimeBodyAccelerometerMagnitude.StandardDeviation..]**                numeric          180  0.00 %   Standard deviation of time Body Accelerometer Magnitude            

**[TimeGravityAccelerometerMagnitude.StandardDeviation..]**             numeric          180  0.00 %   Standard deviation of time Gravity Accelerometer Magnitude             

**[TimeBodyAccelerometerJerkMagnitude.StandardDeviation..]**            numeric          180  0.00 %   Standard deviation of time Body Accelerometer Jerk Magnitude             

**[TimeBodyGyroscopeMagnitude.StandardDeviation..]**                    numeric          180  0.00 %   Standard deviation of time Body Gyroscope Magnitude             

**[TimeBodyGyroscopeJerkMagnitude.StandardDeviation..]**                numeric          180  0.00 %   Standard deviation of time Body Gyroscope Jerk Magnitude            

**[FrequencyBodyAccelerometer.StandardDeviation...X]**                  numeric          180  0.00 %   Standard deviation of frequency Body Accelerometer in direction X             

**[FrequencyBodyAccelerometer.StandardDeviation...Y]**                  numeric          180  0.00 %   Standard deviation of frequency Body Accelerometer in direction Y             

**[FrequencyBodyAccelerometer.StandardDeviation...Z]**                  numeric          180  0.00 %   Standard deviation of frequency Body Accelerometer in direction Z             

**[FrequencyBodyAccelerometerJerk.StandardDeviation...X]**              numeric          180  0.00 %    Standard deviation of frequency Body Accelerometer Jerk in direction X            

**[FrequencyBodyAccelerometerJerk.StandardDeviation...Y]**              numeric          180  0.00 %    Standard deviation of frequency Body Accelerometer Jerk in direction Y            

**[FrequencyBodyAccelerometerJerk.StandardDeviation...Z]**              numeric          180  0.00 %    Standard deviation of frequency Body Accelerometer Jerk in direction Z            

**[FrequencyBodyGyroscope.StandardDeviation...X]**                      numeric          180  0.00 %    Standard deviation of frequency Body Gyroscop in direction X            

**[FrequencyBodyGyroscope.StandardDeviation...Y]**                      numeric          180  0.00 %    Standard deviation of frequency Body Gyroscop in direction Y            

**[FrequencyBodyGyroscope.StandardDeviation...Z]**                      numeric          180  0.00 %    Standard deviation of frequency Body Gyroscop in direction Z            

**[FrequencyBodyAccelerometerMagnitude.StandardDeviation..]**           numeric          180  0.00 %    Standard deviation of frequency Body Accelerometer Magnitude            

**[FrequencyBodyBodyAccelerometerJerkMagnitude.StandardDeviation..]**   numeric          180  0.00 %   Standard deviation of frequency Body Accelerometer Jerk Magnitude            

**[FrequencyBodyBodyGyroscopeMagnitude.StandardDeviation..]**           numeric          180  0.00 %    Standard deviation of frequency Body Gyroscope Magnitude           

**[FrequencyBodyBodyGyroscopeJerkMagnitude.StandardDeviation..]**       numeric          180  0.00 %     Standard deviation of frequency Body Gyroscope Jerk Magnitude          
------------------------------------------------------------------------------------------------------------------------------



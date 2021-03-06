# Getting And Cleaning Data Project
Project for Getting And Cleaning Data Course

Our project introduces us to a very exciting area in all of data science right now is wearable computing.

In the archive of "UCI Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, we can read:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six >activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on >the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a >constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly >partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>
>Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone >(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and >3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The >obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training >data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding >windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion >components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed >to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of >features was obtained by calculating variables from the time and frequency domain.


To merge the training and test datasets in the script run_analysis.R we must download the data from the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###First of all there's to collect the Basic Info in the folder *UCI HAR Dataset* from the files:

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

###Second, in the folders *test* and *train* there's collect sets X and y:

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

###Fourth we select variables participants in our Data Frame of the measurements on the mean and standard deviation for each measurement.
First we select the participating variables in our first data frame to only work with them, optimizing the use of memory on our computer is scarce. This Data Frame is written in the hard drive of the computer.

###Fith we melt our obtained Data Frame to obtain a casted Data Frame.
Our casted Data Frame contains the average of each variable for each activity and each subject. This Data Frame is written in the hard drive of the computer.

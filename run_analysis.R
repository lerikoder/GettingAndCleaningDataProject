## Getting and Cleanning Data Course Project


if(!file.exists("./project")){
    dir.create("./project")
}
setwd("./project")
zpath <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zpath, "DataSet.zip")

# Unzip DataSet: all of the files in our working directory
unzip("DataSet.zip", list = F, junkpaths = TRUE)

# Reading files common to train and test data 
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# Reading train files
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
names(susubject_train) <- "subject"


## Preparing labels for activities in train data
activity_train <- factor(y_train$V1)
levels(activity_train) <- activity_labels$V2

## Deleting parenthesis in names of features
feats <- sub("[(][)]", "", features$V2)
featss <- sub("-", "_", feats)
featss <- sub("-", "_", featss)
## Assigning names to train data
#names(X_train) <- as.character(features$V2)
names(X_train) <- sub("-", "_", featss)

# Reading test files
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
names(subject_test) <- "subject"

## Preparing labels for activities in test data
activity_test <- factor(y_test$V1)
levels(activity_test) <- activity_labels$V2

## Assigning names to test data
#names(X_test) <- as.character(features$V2)
names(X_test)  <- sub("-", "_", featss)

# Selecting labels of participating features ( mean and std )
participant_feat <- names(X_train)[grep("mean|std", features$V2, perl = TRUE)]  

# participant_feat has not the subject and the activity variable names
# in the final dataset we have cbind subject_train and activity_train
# to train data 
# and we have cbind subject_test and activity_test
# to test data 
# and finally rbind train and test data 

# Merging Data Frames to obtain our Working Data Frame
wDataFrame <- rbind(cbind(subject = subject_train, activity = as.character(activity_train), X_train[, participant_feat]), 
                    cbind(subject = subject_test, activity = as.character(activity_test), X_test[, participant_feat]))

# Write our Working Data Frame to a table in text format
write.table(wDataFrame, file = "wDataFrame.txt")

# Finally the tidy Data Frame with the mean of each variable for each activity
# and each subject

library(reshape2)

# create the molten Data Frame
mDataFrame <- melt(wDataFrame, id.vars = c("subject","activity"))

# cast the molten Data Frame 
tDataFrame <- dcast(mDF, subject + activity ~ variable, mean)

# Write the Tidy Data Frame to a table in text format
write.table(tDataFrame, file = "tDataFrame.txt")


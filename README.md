Getting and Cleaning Data
====================
Course Project

# Original instructions:
You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Steps in run_analysis.R:
1. Load the feature key from features.txt
2. Load training and test data sets y retain data columns determined by indices from step 1. and 
3. Merge the training and test data sets
4. Determine the indices of desired features (those containing -mean() or -std())
5. Merge the training and test data sets with descriptive activity names
6. Load the label codes key from activity_labels.txt
7. Replace label codes in the dataset with text labels determined by prior step
8. Appropriately labels the data set with descriptive activity names
9. Merge the training and test data sets with subject names
10. Produce tidy data set "tidy_data.txt" with the average of each variable for each activity/subject combination
#Getting and Cleaning Data
#Course Project
#Step by step are describe the tasks required to prepare tidy data of the "Human Activity Recognition Using Smartphones Data Set"

# 1. Merges the training and the test sets to create one data set.

features <- read.table("UCI HAR Dataset/features.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
x <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

indices_features <- features[grep("(mean|std)\\(", features[,2]),]
mean_std <- X[,indices_features[,1]]

# 3. Uses descriptive activity names to name the activities in the data set

train1 <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
test1 <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
y <- rbind(train1, test1)

labels <- read.table("UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(labels)) {
  code <- as.numeric(labels[i, 1])
  name <- as.character(labels[i, 2])
  y[y$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names. 

X_labels <- cbind(y, X)
mean_std_labels <- cbind(y, mean_std)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
subject <- rbind(subject_train, subject_test)
averages <- aggregate(X, by = list(activity = y[,1], subject = subject[,1]), mean)
write.csv(averages, file='tidy_data.txt', row.names=FALSE)
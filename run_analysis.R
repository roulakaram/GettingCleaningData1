## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each mea
surement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## install packages

if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("reshape2")) {
  install.packages("reshape2")
}

library("data.table")
library("reshape2")


# Load: activity labels: WALKING, STANDING, etc..

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]


# Load the measure names to be used ad data column names: 1 tBodyAcc-mean()-X 2 tBodyAcc-mean()-Y
features_names <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Select (i.e., create a boolean vector for the positions of) the measure related to mean and standard deviation
extract_features <- grepl("mean|std", features_names)

# TEST DATA: Load and process X_test (test set) & y_test (test labels) data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# TEST DATA: read the subject_test.
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features_names

# Extract only mean and standard deviation measures.
X_test = X_test[,extract_features]

# Load the activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data by columns: subjects, y_test, X_test
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# TRAIN DATA: Load and process X_train (train set) & y_train (train labels) data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features_names

# Extract only mean and standard deviation measures.
X_train = X_train[,extract_features]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data by columns: subjects, y_train, X_train
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)
id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)


# Apply the mean function to dataset by the dcast function (group by on "subject + Activity_Label")
tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt")


## This program - 
## Loads Activity labels, Features and Extracting Required Features(mean, std) only
## Loads Train-data, Test-data
## Applies extracted features and binds the required variables 
## Merges train, test data
## Melts merged data to populate measure values for each subject(id)
## Applies mean function to each measurement for each subject; Cast to a list
## Writes final tidy data into text file


##Installing and Loading Packages

install.packages("reshape2")
install.packages("data.table")

require("reshape2")
require("data.table")


##Loading Activity labels, Features and Extracting Required Features(mean, std) only

label.activities <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
all.features <- read.table("UCI HAR Dataset/features.txt")[,2]
extracted.features <- grepl("mean|std", all.features)

## Train-data: Loading data; Applying extracted features and binding 

train.X <- read.table("UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

names(train.X) = all.features

train.X = train.X[,extracted.features]

train.y[,2] = label.activities[train.y[,1]]
names(train.y) = c("Id_Activity", "Label_Activity")
names(train.subject) = "Subject"

data.train <- cbind(as.data.table(train.subject), train.y, train.X)

## Test-data: Loading data; Applying extracted features and binding 

test.X <- read.table("UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

names(test.X) = all.features

test.X = test.X[,extracted.features]

test.y[,2] = label.activities[test.y[,1]]
names(test.y) = c("Id_Activity", "Label_Activity")
names(test.subject) = "Subject"

data.test <- cbind(as.data.table(test.subject), test.y, test.X)


## Merging train, test data; Melt merged data to populate measure values for each subject(id)
merged.data = rbind(data.train, data.test)

id.labels   = c("Subject", "Id_Activity", "Label_Activity")
measure.labels = setdiff(colnames(merged.data), id.labels)
data.melted   = melt(merged.data, id = id.labels, measure.vars = measure.labels)

##  Apply mean function to each measurement for each subject; Cast to a list
final.tidy.data   = dcast(data.melted, Subject + Label_Activity ~ variable, mean)

write.table(final.tidy.data, file = "final_tidy_data.txt")
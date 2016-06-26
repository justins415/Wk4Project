## Run this script in the "UCI HAR Dataset" folder after unzipping.
## The following section loads the necessary files.
features <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")
ytrain <- read.table("train/y_train.txt")
xtrain <- read.table("train/x_train.txt")
subjecttrain <- read.table("train/subject_train.txt")
ytest <- read.table("test/y_test.txt")
xtest <- read.table("test/x_test.txt")
subjecttest <- read.table("test/subject_test.txt")

## This section combines the training and test data sets.
y <- rbind(ytrain, ytest)
x <- rbind(xtrain, xtest)
subject <- rbind(subjecttrain, subjecttest)

## Then removes the old tables.
rm(ytrain, ytest, xtrain, xtest, subjecttrain, subjecttest)

## This section renames the columns in the tables just created.
colnames(y) <- "activity label"
colnames(x) <- t(features[2])
colnames(subject) <- "subject"

## This section combines the columns from the three tables,
## and then removes the old tables.
combined <- cbind(subject, y, x)
rm(subject, y, x)

## This section extracts columns w/ names including "mean" or "std".
meanstdselect <- grep("mean|std", colnames(combined), ignore.case=TRUE)
extracted <- cbind(combined[,(1:2)], combined[,meanstdselect])

## This section merges a column containing the activity label text,
## then removes the old table.
activitylabels <- data.table(activitylabels)
extracted <- data.table(extracted)
colnames(activitylabels) <- c("activity code", "activity")
setkey(extracted, "activity label")
setkey(activitylabels, "activity code")
extractedMerged <- merge(activitylabels, extracted, by.x = "activity code", by.y = "activity label")
rm(extracted)

## This section changes abbreviations to words in the variable names.
colnames(extractedMerged) <- gsub("std","StandardDeviation",colnames(extractedMerged))
colnames(extractedMerged) <- gsub("Freq","Frequency",colnames(extractedMerged))
colnames(extractedMerged) <- gsub("Acc","Accelerometer",colnames(extractedMerged))
colnames(extractedMerged) <- gsub("Gyro","Gyroscope",colnames(extractedMerged))
colnames(extractedMerged) <- gsub("^t","time",colnames(extractedMerged))
colnames(extractedMerged) <- gsub("^f","freq",colnames(extractedMerged))
colnames(extractedMerged) <- gsub("Mag","Magnitude",colnames(extractedMerged))

## This section first groups by subject and activity, then
## it generates a new ordered table containing the mean for each row.
grouped <- group_by(extractedMerged, subject, activity)
tidydata <- summarize_each(grouped, funs(mean))
tidydata <- tidydata[order(tidydata$subject, tidydata$activity),]
write.table(tidydata, "tidy.txt", row.name=FALSE)
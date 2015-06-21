# Assuming the input file is placed and unzipped at the working directory

library(plyr)
library(reshape2)
# union the datasets
x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
data <- rbind(x.train, x.test)

# naming variable names using feature names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
names(data) <- features

# extracting only the measurements on the mean() and std()
selected.col <- grep("mean\\(\\)|std\\(\\)", features)
data <- data[, selected.col]

# removing () from the variable names
names(data) <- gsub("\\(\\)","", names(data))
# replacing - with . within the variable names
names(data) <- gsub("-",".", names(data))

# loading activity data
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "id")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "id")
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("id","name"))
# lookup activity name
activities <- join(rbind(y.train,y.test),activity.labels,by="id")

# loading subject data
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "id")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "id")
subjects <- rbind(subject.train,subject.test)

# attach acitivity and subject columns
data$activity <- activities$name
data$subject <- subjects$id

# melt the data by subject & activity with 66 measurement variables (mean & std)
dataMelt <- melt(data,id=c("subject","activity"),measure.vars=(names(data))[1:66])
# aggregate the data with mean() for each measurement variable grouped by subject & activity
result <- dcast(dataMelt, subject + activity ~ variable, mean)

write.table(result, file="result.txt", row.name = FALSE)

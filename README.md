# getting-and-cleaning-data

This is the course project submission for Getting and Cleaning Data course (using R) on Coursera

To perform tidying the raw data collected from the accelerometers and gyroscope from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

<h3>Steps</h3>

1. Obtain the data set from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Place and unzip the file at the working directory of R
3. <b>Starting point of run_analysis.R:</b> Load both the training and test data from ./UCI HAR Dataset/train/X_train.txt and ./UCI HAR Dataset/test/X_test.txt into R
4. Combine 2 data frames together
5. Reading from ./UCT HAR Dataset/features.txt to name the columns of the data
6. Subsetting the data by selecting only the variables which its names contain mean() or std() string (trimmed down to 66 variables)
7. Renaming variable names to be more R-compatible column name by removing special characters () and - 
8. Load the activity data for both training and test from ./UCI HAR Dataset/train/y_train.txt and ./UCI HAR Dataset/test/y_test.txt and combine them 
9. Load the activity name lookup table from ./UCT HAR Dataset/activity_labels.txt
10. Join the activity data and the lookup table to get its corresponding activity name
11. Load the subject data for both training and test from ./UCT HAR Dataset/train/subject_train.txt and ./UCT HAR Dataset/test/subjecdt_test.txt and combine them
12. Adding the activity name and subject columns to the main data frame
13. Melt the data using subject and activity as key and the 66 variables as measurement variables
14. dcast to provide the tidy data in a form of average value for each variable grouped by activity name and subject
15. Write the produced tidy data to result.txt

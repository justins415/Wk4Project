## Week 4 Getting and Cleaning Data Course Project - README.md

The UCI Human Activity Recognition (HAR) Dataset provides measurements taken from motion sensors embedded in smartphones that were worn while the volunteers performed six different activities.

This project's goal is to extract data contained in multiple tables in the UCI HAR Dataset, to clean it and generate a single table with mean and standard deviation measurements grouped by subject and activity.

Running the "run_analysis.R" script, located in the "UCI HAR Dataset" folder containing the unzipped data, performs the following sequence:

1) Loads all of the necessary files from the included folders.
2) Combines the training and test data sets into one data set (part #1 of the assignment).
3) Replaces the activity "labels/ codes" with the activity names, and adds more descriptive variable names (parts #3 and #4 of the assignment).
4) Extracts the columns/ measurements containing the mean or standard deviation for a given measurement (part #2 of the assignment). 
5) Generates a separate file "tidy.txt" with the tidy data, which groups and averages the measurements extracted in the previous step for each activity and each subject (part #5 of the assignment).

# Getting and Cleaning Data

## Instructions for the Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Configuration for running the project

1. As part of the ```run_analysis.R``` script, you will be prompted to install two packages - ```reshape2``` and ```data.table```.
2. If not already installed, allow the script to install these packages into your R library 

## Steps to execute the project

1. Download the source data source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

2. Extract the zipped data into ```UCI HAR Dataset``` folder.

3. Copy the analysis script ```run_analysis.R``` alongside the folder ```UCI HAR Dataset```.

4. Set the path to the parent folder of dataset folder and analysis script as a working directory using ```setwd()``` function in RStudio.

5. Run the command ```source("run_analysis.R")```, which generates a new file ```final_tidy_data.txt``` in the working directory.
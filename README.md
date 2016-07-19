# Course Project for Getting and Cleaning Data course

This dataset contains information from 30 sudjects in 6 activity states: Laying, Sitting, Standing, Walking, Walking Downstairs, and Walking Upstairs.  Each subject wore a Samsung smartphone on their waist to record their movements using a accelerometer and gyroscope.

To view the raw data, download the files through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please download the zip file to the working directory and unzip the file.

The datasets were linked via cbind and rbind functions.

The variables were renamed to be more descriptive via the colnames function.

Only the mean and standard deviation data were reported in the final dataset. 

To view and run the code please see the: run_analysis.R code.  The code is a function that takes the working directory as an argument.

To call the code input, please run the function indicating your working directory: run_analysis("yourworkingdirectory")

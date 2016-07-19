# Course Project for Getting and Cleaning Data course

This dataset contains information from 30 sudjects in 6 activity states: Laying, Sitting, Standing, Walking, Walking Downstairs, and Walking Upstairs.  Each subject wore a Samsung smartphone on their waist to record their movements using a accelerometer and gyroscope.

To view the raw data, download the files through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please download the zip file to the working directory and unzip the file.

The datasets were linked via cbind and rbind functions.

The variables were renamed to be more descriptive via the colnames function.

Only the mean and standard deviation data were reported in the final dataset. 

To view and run the code please see the: run_analysis.R code.  The code is a function that takes the working directory as an argument.

To call the code input, please run the function indicating your working directory: run_analysis("yourworkingdirectory")

Codebook including column names and descriptions:

subject: number identifier of study subject
activity: label of activity being performed
BodyAccelerometerTimeMean and BodyAccelerometerTimeStd (X, Y, Z): mean and standard deviation body measurement of accelerometer in time X, Y, Z
GravityAccelerometerTimeMean and BodyAccelerometerTimeStd (X, Y, Z): mean and standard deviation gravity measurement of accelerometer in time X, Y, Z
BodyAccelerometerJerkTimeMean and BodyAccelerometerTimeStd (X, Y, Z): mean and standard deviation body jerk measurement of accelerometer in time X, Y, Z
BodyGyroscopeTimeMean and BodyGyroscopeTimeStd (X, Y, Z): mean and standard deviation body measurement of Gyroscope in time X, Y, Z
BodyGyroscopeJerkTimeMean and BodyGyroscopeTimeStd (X, Y, Z): mean and standard deviation body jerk measurement of Gyroscope in time X, Y, Z
BodyAccelerometerMagnitudeTimeMean and BodyAccelerometerMagnitudeTimeStd: mean and standard deviation body measurement of accelerometer magnitude in time
GravityAccelerometerMagnitudeTimeMean and GravityAccelerometerMagnitudeTimeStd: mean and standard deviation gravity measurement of accelerometer magnitude in time
BodyAccelerometerJerkMagnitudeTimeMean and BodyAccelerometerJerkMagnitudeTimeStd: mean and standard deviation body measurement of accelerometer jerk magnitude in time
BodyGyroscopeMagnitudeTimeMean and BodyGyroscopeMagnitudeTimeStd: mean and standard deviation body measurement of Gyroscope magnitude in time
BodyGyroscopeJerkMagnitudeTimeMean and BodyGyroscopeJerkMagnitudeTimeStd: mean and standard deviation body measurement of Gyroscope jerk magnitude in time
BodyAccelerometerFTransformMean and BodyAccelerometerFTransformStd (X, Y, Z): mean and standard deviation body measurement of accelerometer after a Fast Fourier Transform in X, Y, Z axis
BodyAccelerometerFTransformFrequencyMean (X,Y,Z): mean body measurement of accelerometer in Frequency after a Fast Fourier Transform
BodyAccelerometerJerkFTransformMean and BodyAccelerometerFTransformStd (X, Y, Z): mean and standard deviation body jerk measurement of accelerometer after a Fast Fourier Transform in X, Y, Z axis
BodyAccelerometerJerkFTransformFrequencyMean: mean body jerk measurement of accelerometer in Frequency after a Fast Fourier Transform in X, Y, Z axis
BodyAccelerometerMagnitudeFTransformMean and BodyAccelerometerMagnitudeFTransformStd: mean and standard deviation body measurement of accelerometer magnitude after a Fast Fourier Transform
BodyAccelerometerMagnitudeFTransformFrequencyMean: mean body measurement of accelerometer magnitude in frequency after a Fast Fourier Transform
BodyBodyAccelerometerJerkMagnitudeFTransformMean and BodyAccelerometerJerkMagnitudeFTransformStd: mean and standard deviation body measurement of accelerometer jerk magnitude after a Fast Fourier Transform
BodyBodyAccelerometerJerkMagnitudeFTransformFrequencyMean: mean body measurement of accelerometer jerk magnitude in frequency after a Fast Fourier Transform
BodyBodyGyroscopeMagnitudeFTransformMean and BodyGyroscopeMagnitudeFTransformStd: mean and standard deviation body measurement of Gyroscope magnitude after a Fast Fourier Transform
BodyBodyGyroscopeMagnitudeFrequencyFTransformMean: mean and body measurement of Gyroscope magnitude in frequency after a Fast Fourier Transform
BodyGyroscopeJerkMagnitudeFTransformMean: mean body measurement of Gyroscope jerk magnitude after a Fast Fourier Transform




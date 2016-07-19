#Getting and Cleaning Data Course Project

run_analysis <- function(directory) {
        # Set working directory to the location of the raw data.
        setwd(directory)
        
        # read the data into R
        features = read.table("./features.txt")
        activity_labels = read.table("./activity_labels.txt")
        x_train = read.table("./train/X_train.txt")
        y_train = read.table("./train/y_train.txt")
        subject_train <- read.table("./train/subject_train.txt")
        x_test = read.table("./test/X_test.txt")
        y_test = read.table("./test/y_test.txt")
        subject_test <- read.table("./test/subject_test.txt")
        
        #combine train datasets
        train_set <- cbind(subject_train,y_train,x_train)
        
        #combine test datasets
        test_set <- cbind(subject_test,y_test,x_test)
        
        #Merge the training and the test sets to create one data set. 
        x <- rbind(train_set,test_set)
        
        #Appropriately labels the data set with descriptive variable names.
        colnames(x) <- c("subject", "actCode", as.character(features$V2))
        
        #Uses descriptive activity names to name the activities in the data set
        y <- merge(activity_labels,x,by.x="V1",by.y="actCode")
        colnames(y)[2] = "activity"
        
        #Extracts only the measurements on the mean and standard deviation for each measurement.
        toMatch <- c("activity","subject","mean","std")
        z <- y[grep(paste(toMatch,collapse = "|"),names(y))]
        
        #Edit the names again to make them more descriptive
                betternames = c("BodyAccelerometerTimeMeanX",
                              "BodyAccelerometerTimeMeanY",
                             "BodyAccelerometerTimeMeanZ",
                             "BodyAccelerometerTimeStdX",
                             "BodyAccelerometerTimeStdY",
                             "BodyAccelerometerTimeStdZ",
                             "GravityAccelerometerTimeMeanX",
                             "GravityAccelerometerTimeMeanY",
                             "GravityAccelerometerTimeMeanZ",
                             "GravityAccelerometerTimeStdX",
                             "GravityAccelerometerTimeStdY",
                             "GravityAccelerometerTimeStdZ",
                             "BodyAccelerometerJerkTimeMeanX",
                             "BodyAccelerometerJerkTimeMeanY",
                             "BodyAccelerometerJerkTimeMeanZ",
                             "BodyAccelerometerJerkTimeStdX",
                             "BodyAccelerometerJerkTimeStdY",
                             "BodyAccelerometerJerkTimeStdZ",
                             "BodyGyroscopeTimeMeanX",
                             "BodyGyroscopeTimeMeanY",
                             "BodyGyroscopeTimeMeanZ",
                             "BodyGyroscopeTimeStdX",
                             "BodyGyroscopeTimeStdY",
                             "BodyGyroscopeTimeStdZ",
                             "BodyGyroscopeJerkTimeMeanX",
                             "BodyGyroscopeJerkTimeMeanY",
                             "BodyGyroscopeJerkTimeMeanZ",
                             "BodyGyroscopeJerkTimeStdX",
                             "BodyGyroscopeJerkTimeStdY",
                             "BodyGyroscopeJerkTimeStdZ",
                             "BodyAccelerometerMagnitudeTimeMean",
                             "BodyAccelerometerMagnitudeTimeStd",
                             "GravityAccelerometerMagnitudeTimeMean",
                             "GravityAccelerometerMagnitudeTimeStd",
                             "BodyAccelerometerJerkMagnitudeTimeMean",
                             "BodyAccelerometerJerkMagnitudeTimeStd",
                             "BodyGyroscopeMagnitudeTimeMean",
                             "BodyGyroscopeMagnitudeTimeStd",
                             "BodyGyroscopeJerkMagnitudeTimeMean","BodyGyroscopeJerkMagnitudeTimeStd",
                             "BodyAccelerometerFTransformMeanX","BodyAccelerometerFTransformMeanY",
                             "BodyAccelerometerFTransformMeanZ","BodyAccelerometerFTransformStdX",
                             "BodyAccelerometerFTransformStdY","BodyAccelerometerFTransformStdZ",
                             "BodyAccelerometerFTransformFrequencyMeanX","BodyAccelerometerFTransformFrequencyMeanY",
                             "BodyAccelerometerFTransformFrequencyMeanZ",
                             "BodyAccelerometerJerkFTransformMeanX","BodyAccelerometerJerkFTransformMeanY",
                             "BodyAccelerometerJerkFTransformMeanZ","BodyAccelerometerJerkFTransformStdX",
                             "BodyAccelerometerJerkFTransformStdY","BodyAccelerometerJerkFTransformStdZ",
                             "BodyAccelerometerJerkFTransformFrequencyMeanX",
                             "BodyAccelerometerJerkFTransformFrequencyMeanY",
                             "BodyAccelerometerJerkFTransformFrequencyMeanZ",
                             "BodyGyroscopeFTransformMeanX","BodyGyroscopeFTransformMeanY",
                             "BodyGyroscopeFTransformMeanZ","BodyGyroscopeFTransformStdX",
                             "BodyGyroscopeFTransformStdY","BodyGyroscopeFTransformStdZ",
                             "BodyGyroscopeFTransformFrequencyMeanX",
                             "BodyGyroscopeFTransformFrequencyMeanY",
                             "BodyGyroscopeFTransformFrequencyMeanZ",
                             "BodyAccelerometerMagnitudeFTransformMean",
                             "BodyAccelerometerMagnitudeFTransformStd",
                             "BodyAccelerometerMagnitudeFrequencyFTransformMean",
                             "BodyBodyAccelerometerJerkMagnitudeFTransformMean",
                             "BodyBodyAccelerometerJerkMagnitudeFTransformStd",
                             "BodyBodyAccelerometerJerkMagnitudeFrequencyFTransformMean",
                             "BodyBodyGyroscopeMagnitudeFTransformMean",
                             "BodyBodyGyroscopeMagnitudeFTransformStd",
                             "BodyBodyGyroscopeMagnitudeFrequencyFTransformMean",
                             "BodyBodyGyroscopeJerkMagnitudeFTransformMean")
        
        colnames(z)[3:79] = betternames
        
        #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        b <- aggregate(c(z[3:79]),by=y[c("subject","activity")],FUN=mean)
        cdata <- b[order(b$subject),]
        cdata
}
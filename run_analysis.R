#Getting and Cleaning Data Course Project

setwd("/Users/Murph/Desktop/coursera/GetCleanData/UCI HAR Dataset")

features = read.table("./features.txt")
# features = 561 obs. 2 var.

activity_labels = read.table("./activity_labels.txt")
# activity_labels = 6 obs. 2 var.

#all train tables have 7352 obs.
x_train = read.table("./train/X_train.txt")
# x_train = 561 var.
y_train = read.table("./train/y_train.txt")
# y_train = 1 var.
subject_train <- read.table("./train/subject_train.txt")
# subject_train = 1 var.

#combine x and y train datasets
train_set <- cbind(subject_train,y_train,x_train)

x_test = read.table("./test/X_test.txt")
# x_test = 2947 obs. 561 var.
y_test = read.table("./test/y_test.txt")
# y_test = 2947 obs. 1 var.
subject_test <- read.table("./test/subject_test.txt")
# subject_test = 2947 obs. 1 var.

#combine x and y test datasets
test_set <- cbind(subject_test,y_test,x_test)

##1. Merges the training and the test sets to create one data set. 
x <- rbind(train_set,test_set)

#4. Appropriately labels the data set with descriptive variable names.
colnames(x) <- c("subject", "actCode", as.character(features$V2))

#3. Uses descriptive activity names to name the activities in the data set
y <- merge(activity_labels,x,by.x="V1",by.y="actCode")
colnames(y)[2] = "activity"

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
toMatch <- c("activity","subject","mean","std")
z <- y[grep(paste(toMatch,collapse = "|"),names(y))]


#cont. 4.
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

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
b <- aggregate(c(z[3:79]),by=y[c("subject","activity")],FUN=mean)
cdata <- b[order(b$subject),]
cdata
write.table(cdata,file="./week4courseproject.txt",row.names = FALSE)

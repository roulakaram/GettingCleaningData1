
CODE BOOK

Description of  how the data set was generated

Starting from the data: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

described as it follows:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 



The following steps have been performed. 
1.Merging of the training and the test sets to create one data set.
2.Extractions only of the measurements on the mean and standard deviation for each measurement. 
3.Descriptive activity names have been given to name the activities in the data set
4.Appropriate labels have been given to the data set with descriptive variable names. 
5.From the data set in step 4, an independent tidy data set with the average of each variable for each activity and each subject have been created (file tidy.txt).





Code Book

In the following, the variables of the file tidy.txt are described.



Variables in the file tidy.txt:


'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
'-AGGR' is used to denote either the standard deviation -std() or the mean  –mean()

tBodyAcc-AGGR-XYZ
tGravityAcc-AGGR-XYZ
tBodyAccJerk-AGGR-XYZ
tBodyGyro-AGGR-XYZ
tBodyGyroJerk-AGGR-XYZ
tBodyAccMag-AGGR
tGravityAccMag-AGGR
tBodyAccJerkMag-AGGR
tBodyGyroMag-AGGR
tBodyGyroJerkMagv
fBodyAcc-AGGR-XYZ
fBodyAccJerk-AGGR-XYZ
fBodyGyro-AGGR-XYZ
fBodyAccMag-AGGR
fBodyAccJerkMag-AGGR
fBodyGyroMag-AGGR
fBodyGyroJerkMag-AGGR

fBodyAccMag-mean()             
fBodyAccMag-std()              
fBodyAccMag-meanFreq()         
fBodyBodyAccJerkMag-mean()     
fBodyBodyAccJerkMag-std()      
fBodyBodyAccJerkMag-meanFreq() 
fBodyBodyGyroMag-mean()        
fBodyBodyGyroMag-std()         
fBodyBodyGyroMag-meanFreq()    
fBodyBodyGyroJerkMag-mean()    
fBodyBodyGyroJerkMag-std()     
fBodyBodyGyroJerkMag-meanFreq()


Measure Units for the above Variables:
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
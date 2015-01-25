# GACDCourseProject

##Description:

run_analysis.r takes raw data from an experiment conducted by Reyes-Ortiz, Anguita, Ghio and Oneto and the Non-Linear Systems Laboratory at the University of Genoa, Italy and distills it into a tidy dataset for further analysis. Before running run_analysis.r, please read full experiment documentation at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

run_analysis takes the raw data described above and stiches it together into one large dataset containing data from both the test and train groups. It then adds labels for all variables recorded, activities performed by each subject and identifiers for each subject. Once all data is combined into a dataset, it extracts only those variables which describe the mean or standard deviation of an observation. Finally it calculates the mean of the extracted measurements for each subject and each activity pair and prints that information to a file entitled tidyWearables_averages.txt

##Prerequisites:

In order for run_analysis.r to work properly please ensure the following:

1. You have downloaded, unzipped stored in your working directory the files located at the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Please do not rename any files.
2. You have installed both the plyr and dplyr R packages

##Output:

run_analysis outputs the average (NORMALIZED/unit-less/-1<VALUE<1) value for each subject-activity pair

###Key:

* subject = study subject (participant) number
* activity = one of six activities performed: WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, LAYING

* t = measurement made in time domain
* f/freq = measurement made in frequency domain (result of Fourier transform)
* Mean = average
* StDev = Standard deviation
* Body = Measurement associated with the subject's body
* Gravity = Measurement associated with gravity field
* Acceleration = linear acceleration in X,Y,Z directions or total
* Jerk = Dynamic acceleration component
* Gyro = measurement is angular acceleration
* Mag = Magnitude
* angle = measurement of angular displacement (only present in measurement containing a body/gravity pair:

###Variables (88):

* subject
* activity
* tMeanBodyAccelrationX
* tMeanBodyAccelrationY
* tMeanBodyAccelrationZ
* tStDevBodyAccelerationX
* tStDevBodyAccelerationY
* tStDevBodyAccelerationZ
* tMeanGravityAccelerationX
* tMeanGravityAccelerationY
* tMeanGravityAccelerationZ
* tStDevGravityAccelerationX
* tStDevGravityAccelerationY
* tStDevGravityAccelerationz
* tMeanBodyJerkAccelerationX
* tMeanBodyJerkAccelerationY
* tMeanBodyJerkAccelerationZ
* tStDevBodyJerkAccelerationX
* tStDevBodyJerkAccelerationY
* tStDevBodyJerkAccelerationZ
* tMeanBodyGyroX
* tMeanBodyGyroY
* tMeanBodyGyroZ
* tStDevBodyGyroX
* tStDevBodyGyroY
* tStDevBodyGyroZ
* tMeanBodyJerkGyroX
* tMeanBodyJerkGyroY
* tMeanBodyJerkGyroZ
* tStDevBodyJerkGyroX
* tStDevBodyJerkGyroY
* tStDevBodyJerkGyroZ
* tMeanAccelerationMagBody
* tStDevAccelerationMagBody
* tMeanGravityAcceleration
* tStDevGravityAcceleration
* tMeanBodyJerkAcceleration
* tStDevBodyAccelerationJerkMag
* tMeanBodyGyroMag
* tStDevBodyGyroMag
* tMeanBodyJerkGyroMag
* tStDevBodyJerkGyroMag
* fMeanBodyAccelrationX
* fMeanBodyAccelrationY
* fMeanBodyAccelrationZ
* fStDevBodyAccelerationX
* fStDevBodyAccelerationY
* fStDevBodyAccelerationZ
* fMeanGravityAccelerationXFreq
* fMeanGravityAccelerationYFreq
* fMeanGravityAccelerationZFreq
* fStDevGravityAccelerationX
* fStDevGravityAccelerationY
* fStDevGravityAccelerationz
* fMeanBodyJerkAccelerationX
* fMeanBodyJerkAccelerationY
* fMeanBodyJerkAccelerationZ
* fStDevBodyJerkAccelerationXFreq
* fStDevBodyJerkAccelerationYFreq
* fStDevBodyJerkAccelerationZFreq
* fMeanBodyGyroX
* fMeanBodyGyroY
* fMeanBodyGyroZ
* fStDevBodyGyroX
* fStDevBodyGyroY
* fStDevBodyGyroZ
* fMeanBodyJerkGyroXFreq
* fMeanBodyJerkGyroYFreq
* fMeanBodyJerkGyroZFreq
* fMeanBodyAccelerationMag
* fStDevBodyAccelerationMag
* fMeanBodytAccelerationMagFreq
* fMeanBodyAccelerationJerkMag
* fStDevBodyAccelerationJerkMag
* fMeanBodyAccelerationJerkMagFreq
* fMeanBodyGyroMag
* fStDevBodyGyroMag
* fMeanBodyGyroMagFreq
* fMeanBodyGyroJerkMag
* fStDevBodyGyroJerkMag
* fMeanBodyGyroJerkMagFreq
* angletMeanBodyAccelerationGravity
* angletMeanBodyAccelerationJerkGravity
* angletMeanBodyGyroGravity
* angletMeanBodyGyroJerkGravity
* anglemeanGravityX
* anglemeanGravityY
* anglemeanGravityZ

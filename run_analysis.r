####################################################################################################
# This script takes assembles data taken from two sets of expiriments (test and train) and assembles 
# them into a tidy data set. Original documentation on the source data can be found at 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
#
# Once the data are assembled and the rows and columns properly labeled, all variables unrelating to
# the mean and standard deviation of each observation are removed and the data is sorted. Finally
# the average of each variable is taken for each activity and subject and the results printed to a file
# entitled tidyWearables_averages.txt


run_analysis <- function(){
        #Load packages required for analysis
        library(plyr)
        library(dplyr)
        
        #Laod raw data and store in appropriate forms
        data_test <- read.table("./X_test.txt") 
        tbl_df(data_test)
        
        data_train <- read.table("./X_train.txt")
        tbl_df(data_train)
       
        column_labels <- read.table("./features.txt")
        column_labels <- c("subject", "activity", as.character(column_labels[,2])) #create character vector for column names
        
        subject_labels_test <- read.table("./subject_test.txt")
        tbl_df(subject_labels_test)
        subject_labels_train <- read.table("./subject_train.txt")
        tbl_df(subject_labels_train)
        
        activity_names <- read.table("./activity_labels.txt")
        
        activity_labels_test <- read.table("./y_test.txt")
        tbl_df(activity_labels_test)
        activity_labels_train <- read.table("./y_train.txt")
        tbl_df(activity_labels_train)
        
        #Clean column (variable) names of illegal characters
        column_labels <- gsub("\\()|-|\\(|\\)|,", "", column_labels)
        column_labels <- gsub("-", "", column_labels)
        
        #Assemble dataset by rowbinding test and train datasets and columnbinding subject and activity datasets
        subject_labels <- rbind(subject_labels_test, subject_labels_train)
        activity_labels <- rbind(activity_labels_test, activity_labels_train)
        #match activity names to activity labels (i.e. replaace activity numbers with descriptive activity names)
        activity <- join(activity_labels, activity_names)
        
        data_testtrain <- rbind(data_test, data_train)
        subact_data <- cbind(subject_labels, cbind(activity[,2], data_testtrain))
        colnames(subact_data) <- tolower(column_labels)
        
        subact_data <- subact_data[,grep("activity|subject|mean|std", colnames(subact_data))]
        
        #Rename columns with descriptive variable names
        colnames_final <- c("subject","activity","tMeanBodyAccelrationX","tMeanBodyAccelrationY","tMeanBodyAccelrationZ","tStDevBodyAccelerationX","tStDevBodyAccelerationY","tStDevBodyAccelerationZ","tMeanGravityAccelerationX","tMeanGravityAccelerationY","tMeanGravityAccelerationZ","tStDevGravityAccelerationX","tStDevGravityAccelerationY","tStDevGravityAccelerationz","tMeanBodyJerkAccelerationX","tMeanBodyJerkAccelerationY","tMeanBodyJerkAccelerationZ","tStDevBodyJerkAccelerationX","tStDevBodyJerkAccelerationY","tStDevBodyJerkAccelerationZ","tMeanBodyGyroX","tMeanBodyGyroY","tMeanBodyGyroZ","tStDevBodyGyroX","tStDevBodyGyroY","tStDevBodyGyroZ","tMeanBodyJerkGyroX","tMeanBodyJerkGyroY","tMeanBodyJerkGyroZ","tStDevBodyJerkGyroX","tStDevBodyJerkGyroY","tStDevBodyJerkGyroZ","tMeanAccelerationMagBody","tStDevAccelerationMagBody","tMeanGravityAcceleration","tStDevGravityAcceleration","tMeanBodyJerkAcceleration","tStDevBodyAccelerationJerkMag","tMeanBodyGyroMag","tStDevBodyGyroMag","tMeanBodyJerkGyroMag","tStDevBodyJerkGyroMag","fMeanBodyAccelrationX","fMeanBodyAccelrationY","fMeanBodyAccelrationZ","fStDevBodyAccelerationX","fStDevBodyAccelerationY","fStDevBodyAccelerationZ","fMeanGravityAccelerationXFreq","fMeanGravityAccelerationYFreq","fMeanGravityAccelerationZFreq","fStDevGravityAccelerationX","fStDevGravityAccelerationY","fStDevGravityAccelerationz","fMeanBodyJerkAccelerationX","fMeanBodyJerkAccelerationY","fMeanBodyJerkAccelerationZ","fStDevBodyJerkAccelerationXFreq","fStDevBodyJerkAccelerationYFreq","fStDevBodyJerkAccelerationZFreq","fMeanBodyGyroX","fMeanBodyGyroY","fMeanBodyGyroZ","fStDevBodyGyroX","fStDevBodyGyroY","fStDevBodyGyroZ","fMeanBodyJerkGyroXFreq","fMeanBodyJerkGyroYFreq","fMeanBodyJerkGyroZFreq","fMeanBodyAccelerationMag","fStDevBodyAccelerationMag","fMeanBodytAccelerationMagFreq","fMeanBodyAccelerationJerkMag","fStDevBodyAccelerationJerkMag","fMeanBodyAccelerationJerkMagFreq","fMeanBodyGyroMag","fStDevBodyGyroMag","fMeanBodyGyroMagFreq","fMeanBodyGyroJerkMag","fStDevBodyGyroJerkMag","fMeanBodyGyroJerkMagFreq","angletMeanBodyAccelerationGravity","angletMeanBodyAccelerationJerkGravity","angletMeanBodyGyroGravity","angletMeanBodyGyroJerkGravity","anglemeanGravityX","anglemeanGravityY","anglemeanGravityZ")
        colnames(subact_data) <- colnames_final
        
        #Create table_df to use dplyr functions for arranging, grouping and summarizing data
        final_data <- tbl_df(subact_data)
        arrange(final_data, subject, activity)
        final_data <- group_by(final_data, subject, activity)
        tidy_data <<- summarise_each(final_data, funs(mean)) #superassign final dataset so it can be examined outside of this function
        
        write.table(tidy_data, file = "./tidyWearables_averages.txt", row.names = FALSE)
        }

        

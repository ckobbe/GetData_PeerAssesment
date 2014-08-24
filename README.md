Getting and Cleaning Data Project
=================================

Generate a tidy data set from some data[1]

## Using run_analysis.R

From the base project directory, source("run_analysis.R") then run_analysis()
It will download/unzip the data if it is missing.

run_analysis() will pull in the test and training sets from the UCI HAR set, pull the mean and standard deviation columns, and average them for each subject number and activity type pair.

## Columns 

final.txt contains a header with columns, which are:

"tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
"tBodyAcc.mean...Z"           "tBodyAcc.std...X"           
"tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
"tGravityAcc.mean...X"        "tGravityAcc.mean...Y"       
"tGravityAcc.mean...Z"        "tGravityAcc.std...X"        
"tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
"tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
"tBodyAccJerk.mean...Z"       "tBodyAccJerk.std...X"       
"tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
"tBodyGyro.mean...X"          "tBodyGyro.mean...Y"         
"tBodyGyro.mean...Z"          "tBodyGyro.std...X"          
"tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
"tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
"tBodyGyroJerk.mean...Z"      "tBodyGyroJerk.std...X"      
"tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
"tBodyAccMag.mean.."          "tBodyAccMag.std.."          
"tGravityAccMag.mean.."       "tGravityAccMag.std.."       
"tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."      
"tBodyGyroMag.mean.."         "tBodyGyroMag.std.."         
"tBodyGyroJerkMag.mean.."     "tBodyGyroJerkMag.std.."     
"fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
"fBodyAcc.mean...Z"           "fBodyAcc.std...X"           
"fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
"fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
"fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"       
"fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"       
"fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
"fBodyGyro.mean...Z"          "fBodyGyro.std...X"          
"fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
"fBodyAccMag.mean.."          "fBodyAccMag.std.."          
"fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."  
"fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."     
"fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.."

Which are all pretty self-explanatory, and "subject.activity" which is a concatination of the subject number and activity type for which the other columns were averaged.


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
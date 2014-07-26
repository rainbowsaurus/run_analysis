CodeBook:

This codebook will describe the variable names and transformations to the original dataset taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This dataset describes observations 

1. This file was unzipped into the working directory.

2. The X data provided observations of various features (found in original features.txt file). The X data for training and testing were merged into one dataset.

3. The Y data provided manual observations based on the activity a person was doing when the X data observations were recorded.  Y data was merged for training and testing.

4. Both X and Y datasets were merged to provide 1 comprehensive dataset.

5. Labels were added to describe the observations of the X data.

6. Information on the subject of each observation was added to the dataset.

7. The original data provided numbers for each activity. I transformed the number codes into the name of the activity as follows:
1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING_DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING

8. I took out only the columns showing observations of means and standard deviations.

9. The data was melted with "subject" and "activity" as the ids. It was then casted to show the averages of each measurement for each activity and each subject. The resulting data file can be seen in the file tidydata.txt

Key:
"subject" - The volunteer performing the actions that are being observed.
"activity" - The activity the volunteer was performing at the time of the observation. Activity includes: Walking, Walking upstairs, Walking downstairs, sitting, standing, or laying.

The rest of the variables can be described in the features.txt of the original documentation shown below.
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y" 
"tBodyAcc-mean()-Z" 
"tGravityAcc-mean()-X" 
"tGravityAcc-mean()-Y" 
"tGravityAcc-mean()-Z" 
"tBodyAccJerk-mean()-X" 
"tBodyAccJerk-mean()-Y" 
"tBodyAccJerk-mean()-Z" 
"tBodyGyro-mean()-X" 
"tBodyGyro-mean()-Y" 
"tBodyGyro-mean()-Z" 
"tBodyGyroJerk-mean()-X" 
"tBodyGyroJerk-mean()-Y" 
"tBodyGyroJerk-mean()-Z" 
"tBodyAccMag-mean()" 
"tGravityAccMag-mean()" 
"tBodyAccJerkMag-mean()" 
"tBodyGyroMag-mean()" 
"tBodyGyroJerkMag-mean()" 
"fBodyAcc-mean()-X" 
"fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z" 
"fBodyAccJerk-mean()-X" 
"fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" 
"fBodyGyro-mean()-X" 
"fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z" 
"fBodyAccMag-mean()" 
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyGyroMag-mean()" 
"fBodyBodyGyroJerkMag-mean()"

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
